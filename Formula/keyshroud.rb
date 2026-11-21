class Keyshroud < Formula
  desc "Let AI coding agents use your secrets without ever seeing them"
  homepage "https://keyshroud.dev"
  url "https://registry.npmjs.org/keyshroud/-/keyshroud-0.15.0.tgz"
  sha256 "56042b1856eebe99cad6aadc471537f7b882ce0cc4d34380cf0d627d458e7d9c"
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
