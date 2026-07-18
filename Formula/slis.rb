class Slis < Formula
  desc "Multi-repo worktree cockpit: a TUI + CLI for working across many git repos at once"
  homepage "https://github.com/jonnyom/slis"
  version "0.7.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_arm64.tar.gz"
      sha256 "29310d42d4164a5d25d3d13ab3de4f2b2a99e06e0dffadec2bb9c26f1007ecfa"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_amd64.tar.gz"
      sha256 "bfdc1b72f87670514464e108bd90939ea6a90607d53eb12442f7fac8fe9d3096"
    end
    depends_on "terminal-notifier"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_arm64.tar.gz"
      sha256 "28f0314ac4d138f10f8aed68c1dd4f0f3281cf28917bcb4028863ae0f0fd7a86"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_amd64.tar.gz"
      sha256 "f00b5394b8acb368f79cbee1258f8db3af61709af9fdc85893e7178ad8ceabb8"
    end
  end

  def install
    bin.install "slis"
    bin.install "slis-ui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/slis --version")
  end
end
