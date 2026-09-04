class AgentsHistory < Formula
  desc "Fuzzy-search terminal session history for Claude Code, Codex, Grok, and Antigravity"
  homepage "https://github.com/bricklayor/agents-history"
  version "0.1.79"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.1.79/agents-history-darwin-arm64.tar.gz"
    sha256 "271fee5e4e49d1d5a85033213ea69df299c12d246646973583076b7db8d7333e"
  end

  on_linux do
    url "https://github.com/bricklayor/homebrew-tap/releases/download/v0.1.79/agents-history-linux-amd64.tar.gz"
    sha256 "01ece60e1ccdab73e78721b0fe6b58d9d5f3da52d4a349a9cf3ae31b69770df1"
  end

  def install
    bin.install "agents-history"
    prefix.install "LICENSE" if File.exist?("LICENSE")
    lib.install Dir["lib/*"]
    bin.install_symlink lib/"libonnxruntime.dylib" if OS.mac?
    bin.install_symlink lib/"libonnxruntime.so" if OS.linux?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agents-history --version")
  end
end
