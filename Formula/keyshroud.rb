class Keyshroud < Formula
  desc "Let AI coding agents use your secrets without ever seeing them"
  homepage "https://keyshroud.dev"
  url "https://registry.npmjs.org/keyshroud/-/keyshroud-0.12.3.tgz"
  sha256 "9265c3e9de595e314a8caa872dcc9b4724380c8b6fb7f7a1e3686a53d2d929b9"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/keyshroud --version")
    # A new home has no vault yet, and status says so.
    assert_match "vault=none", shell_output("#{bin}/keyshroud status")
  end
end
