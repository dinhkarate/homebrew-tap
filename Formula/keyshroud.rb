class Keyshroud < Formula
  desc "Let AI coding agents use your secrets without ever seeing them"
  homepage "https://keyshroud.dev"
  url "https://registry.npmjs.org/keyshroud/-/keyshroud-0.13.0.tgz"
  sha256 "d46b62fc1f37406b87bf9ee519c94fc767e9be866d86fc4c752851f28c2606aa"
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
