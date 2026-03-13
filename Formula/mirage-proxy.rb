class MirageProxy < Formula
  desc "Invisible sensitive data filter for LLM APIs"
  homepage "https://github.com/chandika/mirage-proxy"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-macos-arm64"
      sha256 "6f50d44d27af43045358066ee796a379c276f10608922ef88c7cf4462b635990"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-macos-x86_64"
      sha256 "3fa042b58d15f2c6574f97cddacc3ac7551c546cc7732c8fa862c2763e366fb1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-linux-arm64"
      sha256 "e0c38beabcb1352ef3646a46965e09c81d0879b5088ed42b56acd0432b2337d0"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v#{version}/mirage-proxy-v#{version}-linux-x86_64"
      sha256 "db2546ecede84f56ce529f53fbd2d1541716ac56a690c3844c4efa8825a50785"
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
