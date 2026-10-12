class Samskara < Formula
  desc "Capture and search AI coding-agent session logs"
  homepage "https://github.com/vertexcover-io/samskara"
  url "https://github.com/vertexcover-io/samskara/releases/download/v0.5.2/samskara-cli-0.5.2.tgz"
  sha256 "9d1ef5cc222dd70c69c3552c8311d119dba77d85a4c3ee4004ad93e6165edda3"
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
