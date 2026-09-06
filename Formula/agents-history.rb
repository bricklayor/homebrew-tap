class AgentsHistory < Formula
  desc "Fuzzy-search terminal session history for Claude Code, Codex, Grok, and Antigravity"
  homepage "https://github.com/bricklayor/agents-history"
  version "0.1.81"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.1.81/agents-history-darwin-arm64.tar.gz"
    sha256 "e77758f6b50c0721376264ce0a86d576f436f87f834f4285c5fa2ff9c85669b6"
  end

  on_linux do
    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.1.81/agents-history-linux-amd64.tar.gz"
    sha256 "f559a14d6135688292bf58abada628ad50d42b0ef33e82b76cc89b2e1ff61a6f"
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
