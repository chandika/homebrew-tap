class MirageProxy < Formula
  desc "Invisible sensitive data filter for LLM APIs"
  homepage "https://github.com/chandika/mirage-proxy"
  version "0.5.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-macos-arm64"
      sha256 "d54af281c92d3684d55700421eb19df5da8034d98fe645c66eead096771be53c"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-macos-x86_64"
      sha256 "e21812e3eef34cc14c17c9a4b3264cfd86f9c2bf6a75f62c13be77570d9c746a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-linux-arm64"
      sha256 "c12929f003407be1c668da7047bd6e82b9e491b0a93f5e01324266e3a2aacd0c"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-linux-x86_64"
      sha256 "f8477878836c282c6acdd1821702cfb7f6e37d6e8c663b3b7813d35d42092311"
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
