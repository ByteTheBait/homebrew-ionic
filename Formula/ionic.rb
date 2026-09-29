class Ionic < Formula
  desc "Statically-typed, self-hosting compiled language targeting native ARM64 (macOS)"
  homepage "https://github.com/ByteTheBait/Ionic-Compiler"
  url "https://github.com/ByteTheBait/Ionic-Compiler/releases/download/v0.1.1/ionic-v0.1.1-aarch64-apple-darwin.tar.gz"
  sha256 "41c9333ffd65a37286d8be1759dbc226b167608e6588ba6e310796072f267f73"
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
