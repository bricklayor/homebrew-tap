class AgentsHistory < Formula
  desc "Fuzzy-search terminal session history for Claude Code, Codex, Grok, and Antigravity"
  homepage "https://github.com/bricklayor/agents-history"
  version "0.3.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.3.1/agents-history-darwin-arm64.tar.gz"
    sha256 "024ae13e7c91c6991f1cc156de3d286f3957a44124874e7caad13e6ce68d5164"
  end

  on_linux do
    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.3.1/agents-history-linux-amd64.tar.gz"
    sha256 "efab1c5a2bc61fab5c73d63ca7a348752436083531a7550ef0064066866dbffa"
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
