class Samskara < Formula
  desc "Capture and search AI coding-agent session logs"
  homepage "https://github.com/vertexcover-io/samskara"
  url "https://github.com/vertexcover-io/samskara/releases/download/v0.5.5/samskara-cli-0.5.5.tgz"
  sha256 "e815ecfc98874980d78b5dffaa4b92b9c5a287e61a4476a6c036b2c9b849dfd9"
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
