class MirageProxy < Formula
  desc "Invisible sensitive data filter for LLM APIs"
  homepage "https://github.com/chandika/mirage-proxy"
  version "0.5.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-macos-arm64"
      sha256 "67f0125a07a85e36079a0b5ad46bd0f3afa0efab69ae3c17e57363d3541d29ae"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-macos-x86_64"
      sha256 "44f8a6f0fab1453097c742f7a9d7ff8710eab9b1fd33c9295ba33ff0dc9e00df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-linux-arm64"
      sha256 "5ed661f5b3ea8bc04db7de14e1e57398fc4a24e78f2e10f8515938ed1fe4b48e"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-linux-x86_64"
      sha256 "f3c7289c0440c08ddc410e9760896064ef68bc7237b1b62aa5eb9ebad2cf5341"
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
