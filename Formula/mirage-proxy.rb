class MirageProxy < Formula
  desc "Invisible sensitive data filter for LLM APIs"
  homepage "https://github.com/chandika/mirage-proxy"
  version "0.7.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.7.3/mirage-proxy-v0.7.3-macos-arm64"
      sha256 "269b957485594adbb3350d441da156dc4557170bf660ded570599822c245686c"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.7.3/mirage-proxy-v0.7.3-macos-x86_64"
      sha256 "e01277a77e7d12508a45aeeca7ecdf9ba20040bc39867acfde3eb01e22ea2eea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.7.3/mirage-proxy-v0.7.3-linux-arm64"
      sha256 "23227fe2242740c85dada68f36432d4e6b9424d99f22f2e2059df8e81fcec0ce"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.7.3/mirage-proxy-v0.7.3-linux-x86_64"
      sha256 "12295685441970bc660985dd489aed497a7c1cd212c35cfaab9d9976192ddbc9"
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
