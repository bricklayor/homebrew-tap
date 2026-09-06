class AgentsHistory < Formula
  desc "Fuzzy-search terminal session history for Claude Code, Codex, Grok, and Antigravity"
  homepage "https://github.com/bricklayor/agents-history"
  version "0.1.81"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.1.81/agents-history-darwin-arm64.tar.gz"
    sha256 "a8da0146482edc681b7d9d3596462a3768876be6b1b7ba7dbb9c922a57972559"
  end

  on_linux do
    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.1.81/agents-history-linux-amd64.tar.gz"
    sha256 "94d24b4911f439893063786edf12a7221dda55a375477004a2954703cefdd014"
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
