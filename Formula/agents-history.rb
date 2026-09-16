class AgentsHistory < Formula
  desc "Fuzzy-search terminal session history for Claude Code, Codex, Grok, and Antigravity"
  homepage "https://github.com/bricklayor/agents-history"
  version "0.2.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.2.1/agents-history-darwin-arm64.tar.gz"
    sha256 "0cdc482b6f24cd987af7a7cf31d9dab8bf2b9d19224ef1160b3a46315a69229f"
  end

  on_linux do
    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.2.1/agents-history-linux-amd64.tar.gz"
    sha256 "3f693c8b4a54c7777da779a6aba80b05a5f004b73107364847a9f64fd7bce710"
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
