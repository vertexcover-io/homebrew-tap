class Yok < Formula
  desc "Run coding agents through a workflow, from ticket to PR"
  homepage "https://github.com/vertexcover-io/yok"
  version "0.0.1"
  license :cannot_represent

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vertexcover-io/yok-darwin-arm64/-/yok-darwin-arm64-0.0.1.tgz"
      sha256 "4c1d0d3dc226c887952c83c44aa1207dd1fe9684df25e7330b449154b53c83d1"
    end
    on_intel do
      url "https://registry.npmjs.org/@vertexcover-io/yok-darwin-x64/-/yok-darwin-x64-0.0.1.tgz"
      sha256 "93e48352740e32402373f59ef2972db0348fc350424d1fbcbe4ca909c210a3c7"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vertexcover-io/yok-linux-arm64/-/yok-linux-arm64-0.0.1.tgz"
      sha256 "2a0d9538da1ab10626e15dacda471cdcf9b198a3c047a25163bf36967f372f8f"
    end
    on_intel do
      url "https://registry.npmjs.org/@vertexcover-io/yok-linux-x64/-/yok-linux-x64-0.0.1.tgz"
      sha256 "c3dac92c6fc99fe67eeab8ddf1cc63aeda52ec8d79f3857a2726cacb44d2dd4e"
    end
  end

  def install
    bin.install "bin/yok"
  end

  def caveats
    <<~EOS
      Install the yok plugin into your agent, after every upgrade too:
        yok plugin install --agent claude
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/yok --version").strip
  end
end
