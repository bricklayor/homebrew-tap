class AgentsHistory < Formula
  desc "Fuzzy-search terminal session history for Claude Code, Codex, Grok, and Antigravity"
  homepage "https://github.com/bricklayor/agents-history"
  version "0.3.2"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.3.2/agents-history-darwin-arm64.tar.gz"
    sha256 "f0740c3bf72ab7c91015788ad0431796e188dae812768f06a5d8c2c1d3d3d6f1"
  end

  on_linux do
    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.3.2/agents-history-linux-amd64.tar.gz"
    sha256 "350174e55d570ad0f7c6ebc11dfb488972b465e91474550b00f22f15a208baad"
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
