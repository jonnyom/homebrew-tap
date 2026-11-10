class Slis < Formula
  desc "Multi-repo worktree cockpit: a TUI + CLI for working across many git repos at once"
  homepage "https://github.com/jonnyom/slis"
  version "0.15.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_arm64.tar.gz"
      sha256 "dec115df2f7efe16aa9f345ffaa5ab41e66a8da347c7081cb355d50bd39621d6"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_amd64.tar.gz"
      sha256 "7b7c4ba50511bccaef9a6ea2881b64584c7dfc86e02cc0eea4ab974bb767e92c"
    end
    depends_on "terminal-notifier"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_arm64.tar.gz"
      sha256 "1d422fb08deb29405a8ea82c2827ed59e45285b642f89169520ca2e26deb7f1a"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_amd64.tar.gz"
      sha256 "55595bc034002691bb25c617de7646e04f0dc2ad44ecd8975ff9c8e352558447"
    end
  end

  def install
    bin.install "slis"
    bin.install "slis-ui"
    libexec.install "zmx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/slis --version")
  end
end
