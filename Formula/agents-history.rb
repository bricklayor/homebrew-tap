class AgentsHistory < Formula
  desc "Fuzzy-search terminal session history for Claude Code, Codex, Grok, and Antigravity"
  homepage "https://github.com/bricklayor/agents-history"
  version "0.1.80"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.1.80/agents-history-darwin-arm64.tar.gz"
    sha256 "7e8f9d702a4c6dc4bbdb00c81c27ba340dd0cc37f5e93fd15cf22a51a368735c"
  end

  on_linux do
    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.1.80/agents-history-linux-amd64.tar.gz"
    sha256 "4441702cab9a37952d83c7ea4f12f0db8f0fb87a855eee8dd79f727fb4899001"
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
