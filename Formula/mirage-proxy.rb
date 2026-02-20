class MirageProxy < Formula
  desc "Invisible sensitive data filter for LLM APIs"
  homepage "https://github.com/chandika/mirage-proxy"
  version "0.7.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-macos-arm64"
      sha256 "bf40807e5b95677dc2695a9711133c4894f66de8adb81ea2a5febec69d98ea13"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-macos-x86_64"
      sha256 "6a5e32328a11cea3e80ec954ff4bdde8d1b4b0e7a023c8bb5b6f9f3ceb8b3015"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-linux-arm64"
      sha256 "c135b5af56ce58c27b4cd06bee954c1484e2b5bd50ad6121ae2c6cb598f0dce3"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-linux-x86_64"
      sha256 "f661a40ae866c8649c09f8ac62f306a99216156dd928d4ed6ecc5ea7326f5847"
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
