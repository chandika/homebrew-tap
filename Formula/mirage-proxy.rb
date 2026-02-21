class MirageProxy < Formula
  desc "Invisible sensitive data filter for LLM APIs"
  homepage "https://github.com/chandika/mirage-proxy"
  version "0.7.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-macos-arm64"
      sha256 "bacec8f877e406e0f9a34b9a504abdaaf31d435464a03e2e4adabbfbf6b88253"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-macos-x86_64"
      sha256 "fb2a6f4d95cb446fc94a480ee80256304aff7486342f8e006fb400c2d9d0387f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-linux-arm64"
      sha256 "90b0aab55e8e70d14c79c06af5f5fc92b03606d7e45cd9c1e716a55dcfe7fc3d"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-linux-x86_64"
      sha256 "4b8c0ebe53113a014f5e1e003a4e4b65ebcb05c3e8368e03009663166a38e115"
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
