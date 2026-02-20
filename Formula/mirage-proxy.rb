class MirageProxy < Formula
  desc "Invisible sensitive data filter for LLM APIs"
  homepage "https://github.com/chandika/mirage-proxy"
  version "0.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.7.2/mirage-proxy-v0.7.2-macos-arm64"
      sha256 "108e34c13b7953cf72256af41b5d9de1fd23ef1456dd8243613fefc95e9b6178"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.7.2/mirage-proxy-v0.7.2-macos-x86_64"
      sha256 "0c4ecfbf25c697ecfd1da044e928f6d7fc1924c692b701d66d0c03b52e631ba3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.7.2/mirage-proxy-v0.7.2-linux-arm64"
      sha256 "4e9f9ac7e89780a6fe8bf165d6de01f015e7caac0aa47c0cf57a29271ba81a5f"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.7.2/mirage-proxy-v0.7.2-linux-x86_64"
      sha256 "554ba642fb7a43a6975d42e896a0aa162f21e6b530cff87baab24024529b54b9"
    end
  end

  def install
    binary = Dir["mirage-proxy-*"].first || "mirage-proxy"
    bin.install binary => "mirage-proxy"
  end

  test do
    assert_match "mirage-proxy", shell_output("#{bin}/mirage-proxy --version")
  end
end
