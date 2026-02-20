class MirageProxy < Formula
  desc "Invisible sensitive data filter for LLM APIs"
  homepage "https://github.com/chandika/mirage-proxy"
  version "0.5.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.5.17/mirage-proxy-v0.5.17-macos-arm64"
      sha256 "18b45bd9750b509ec67d60a165f203845061e558a854593b2af3b4d12a28bc33"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.5.17/mirage-proxy-v0.5.17-macos-x86_64"
      sha256 "85650d55114c9d1e11169ece84a7ea18891788556a33df32e56f30f48e975c33"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.5.17/mirage-proxy-v0.5.17-linux-arm64"
      sha256 "a8e659d019899b371b3a3acd3f5f837b0b64eaf967f57d68a2657a31590f419c"
    else
      url "https://github.com/chandika/mirage-proxy/releases/download/v0.5.17/mirage-proxy-v0.5.17-linux-x86_64"
      sha256 "09546ae2372f962976d11c4153bf4c8219026eda9668b54a229cd0b70cdf80c2"
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
