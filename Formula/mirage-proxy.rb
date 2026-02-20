class MirageProxy < Formula
  desc "Invisible sensitive data filter for LLM APIs"
  homepage "https://github.com/chandika/mirage-proxy"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.7.1/mirage-proxy-v0.7.1-macos-arm64"
      sha256 "b1f81288984678293dfd17bdeb5e91b7c09c62858285b4801d720d65fbc3b1f6"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.7.1/mirage-proxy-v0.7.1-macos-x86_64"
      sha256 "4e116fcfadf563315abfd38aec3f637d90b1719b2ce2d49a24caa50894a718cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.7.1/mirage-proxy-v0.7.1-linux-arm64"
      sha256 "d34659f6d2963ae137aa7a5b895c34471e362d9d249d6b27a3261931f99bd827"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.7.1/mirage-proxy-v0.7.1-linux-x86_64"
      sha256 "2d9d79dc65381f135d2e0c69de3ae8988542a8ec8e73ff512e90c31b0ce95c88"
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
