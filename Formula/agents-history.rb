class AgentsHistory < Formula
  desc "Fuzzy-search terminal session history for Claude Code, Codex, Grok, and Antigravity"
  homepage "https://github.com/bricklayor/agents-history"
  version "0.1.81"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.1.81/agents-history-darwin-arm64.tar.gz"
    sha256 "119bb57a77ff08039818bb0333217b4275b13cecd12f12839074162e90efee0a"
  end

  on_linux do
    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.1.81/agents-history-linux-amd64.tar.gz"
    sha256 "d52cb2a014ee20981ca0b1b3d68ad12e5ae137c0d455c9b1f8914132feef40fc"
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
