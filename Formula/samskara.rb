class Samskara < Formula
  desc "Capture and search AI coding-agent session logs"
  homepage "https://github.com/vertexcover-io/samskara"
  url "https://github.com/vertexcover-io/samskara/releases/download/v0.5.0/samskara-cli-0.5.0.tgz"
  sha256 "5ce782d1884082419734f090a2b2d19083d07a34f595b9e953074ee49703db62"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false)
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/samskara --version")
    refute_empty libexec.glob("lib/node_modules/**/better-sqlite3/build/Release/better_sqlite3.node")
  end
end
