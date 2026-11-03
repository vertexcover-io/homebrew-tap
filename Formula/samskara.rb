class Samskara < Formula
  desc "Capture and search AI coding-agent session logs"
  homepage "https://github.com/vertexcover-io/samskara"
  url "https://github.com/vertexcover-io/samskara/releases/download/v0.5.4/samskara-cli-0.5.4.tgz"
  sha256 "a0993a8baccdd8760c83226a975cbf1ce0617ff6ed716ade5f89ee563d31039d"
  license "MIT"

  depends_on "node@24"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false)
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/samskara --version")
    refute_empty libexec.glob("lib/node_modules/**/better-sqlite3/build/Release/better_sqlite3.node")
  end
end
