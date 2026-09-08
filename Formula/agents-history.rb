class AgentsHistory < Formula
  desc "Fuzzy-search terminal session history for Claude Code, Codex, Grok, and Antigravity"
  homepage "https://github.com/bricklayor/agents-history"
  version "0.2.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.2.0/agents-history-darwin-arm64.tar.gz"
    sha256 "13c8b2ff8c001cbdf72b0ebcf6bb978cf2e5fc9e734ab8eba07fd5c239288090"
  end

  on_linux do
    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.2.0/agents-history-linux-amd64.tar.gz"
    sha256 "6638817165ae0a77a1a9b4d117c17c7644993619fd34ac3dec63f81d10cc206c"
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
