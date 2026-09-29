class Ionic < Formula
  desc "Statically-typed, self-hosting compiled language targeting native ARM64 (macOS)"
  homepage "https://github.com/ByteTheBait/Ionic-Compiler"
  url "https://github.com/ByteTheBait/Ionic-Compiler/releases/download/v0.2.0/ionic-v0.2.0-aarch64-apple-darwin.tar.gz"
  sha256 "cc7371ef106f4ba90063077b48cf517f5023389c7d92aae961db113fe2890688"
  license "MIT"

  # macOS-only, Apple Silicon only — built and tested on macos-latest (arm64)
  depends_on macos: :sonoma

  def install
    bin.install "ionic"
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
