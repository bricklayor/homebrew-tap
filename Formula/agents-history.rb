class AgentsHistory < Formula
  desc "Fuzzy-search terminal session history for Claude Code, Codex, Grok, and Antigravity"
  homepage "https://github.com/bricklayor/agents-history"
  version "0.3.3"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.3.3/agents-history-darwin-arm64.tar.gz"
    sha256 "6e13ac2245a4d99aab3f47c6d54a847aa0381fa745a2c32d4ea3bb85961b67a1"
  end

  on_linux do
    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.3.3/agents-history-linux-amd64.tar.gz"
    sha256 "c37d5244da04a4f6980e391b0f9b1841d243f99a70efb8ddf21e82a5476bff1c"
  end

  def install
    bin.install "agents-history"
    lib.install Dir["lib/*"]
    bin.install_symlink lib/"libonnxruntime.dylib" if OS.mac?
    bin.install_symlink lib/"libonnxruntime.so" if OS.linux?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agents-history --version")
  end
end
