class Keyshroud < Formula
  desc "Let AI coding agents use your secrets without ever seeing them"
  homepage "https://keyshroud.dev"
  url "https://registry.npmjs.org/keyshroud/-/keyshroud-0.12.2.tgz"
  sha256 "137b4c08ba5bed01d805446c2a0403c645d1fffa14d69aabd53406cc3cdf1eb4"
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
