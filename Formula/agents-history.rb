class AgentsHistory < Formula
  desc "Fuzzy-search terminal session history for Claude Code, Codex, Grok, and Antigravity"
  homepage "https://github.com/bricklayor/agents-history"
  version "0.3.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.3.0/agents-history-darwin-arm64.tar.gz"
    sha256 "cd1fba8a07a3a7315306328a922b494c254e7c4d8cb7afe6f87b40c469830405"
  end

  on_linux do
    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.3.0/agents-history-linux-amd64.tar.gz"
    sha256 "e779b78126a7a723d32cca577a11a03aabda0390c677d151a2a1ed08d33769ef"
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
