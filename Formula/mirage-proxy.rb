class MirageProxy < Formula
  desc "Invisible sensitive data filter for LLM APIs"
  homepage "https://github.com/chandika/mirage-proxy"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.7.1/mirage-proxy-v0.7.1-macos-arm64"
      sha256 "a958da4b82b2c999414f89321b7d635fca62363cef39cd397dec637beab7029d"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.7.1/mirage-proxy-v0.7.1-macos-x86_64"
      sha256 "e317233ad18996913b78bc6874a5cf1b6bcd1bcb8f86eb96bb90687def248eb1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.7.1/mirage-proxy-v0.7.1-linux-arm64"
      sha256 "fd22450f3e3a7f4f027885c823042f7264ece1214d41f2d91c6557ea924ce14b"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.7.1/mirage-proxy-v0.7.1-linux-x86_64"
      sha256 "36c0f84960857f6b18b98848f9a91da153f3e27c259caa2bb752fd2e07123712"
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
