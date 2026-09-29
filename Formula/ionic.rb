class Ionic < Formula
  desc "Statically-typed, self-hosting compiled language targeting native ARM64 (macOS)"
  homepage "https://github.com/ByteTheBait/Ionic-Compiler"
  url "https://github.com/ByteTheBait/Ionic-Compiler/releases/download/v0.2.1/ionic-v0.2.1-aarch64-apple-darwin.tar.gz"
  sha256 "71592fb5aa681109ae8a0aadfffce240dc6a0b81d5d0fe613f42a4c9b89e6b8f"
  license "MIT"

  # macOS-only, Apple Silicon only — built and tested on macos-latest (arm64)
  depends_on macos: :sonoma

  def install
    # The compiler locates its bundled standard library and C runtime
    # relative to its own executable ($IONIC_ROOT, published by the runtime
    # at startup). They must therefore sit next to the real binary, so we
    # install the whole tree into libexec and expose `ionic` via a wrapper
    # that execs it in place — a plain `bin.install "ionic"` would strip
    # lib/ and src/ out from under it.
    libexec.install "lib"
    libexec.install "src"
    libexec.install "ionic"
    bin.write_exec_script libexec/"ionic"
  end

  test do
    (testpath/"hello.ionic").write <<~IONIC
      fn main() -> int64 {
        print("hello, ionic!");
        return 0;
      }
    IONIC
    system bin/"ionic", "hello.ionic", "-o", "hello"
    assert_match "hello, ionic!", shell_output("./hello")
  end
end
