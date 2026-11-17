class Keyshroud < Formula
  desc "Let AI coding agents use your secrets without ever seeing them"
  homepage "https://keyshroud.dev"
  url "https://registry.npmjs.org/keyshroud/-/keyshroud-0.12.1.tgz"
  sha256 "123c4fed95ee8608607a6fdd5fa0f6b3acccd55be8b6ef4c3ed8bdadf12c5ddd"
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
