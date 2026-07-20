class Slis < Formula
  desc "Multi-repo worktree cockpit: a TUI + CLI for working across many git repos at once"
  homepage "https://github.com/jonnyom/slis"
  version "0.7.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_arm64.tar.gz"
      sha256 "1d05ac31bba6b4ee06f4d16a588bc62ce674c1c6cadc4dc2611dc540dd382378"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_amd64.tar.gz"
      sha256 "d3f59eba6be41f09e3ebcbc863dabf2d9f8d9c7db63affa693d3e1cfa604154b"
    end
    depends_on "terminal-notifier"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_arm64.tar.gz"
      sha256 "20eb6e126dd660a8413989c51e83b65a28a10fddf701b1fcd2d772f864cbc310"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_amd64.tar.gz"
      sha256 "2f54305daa5b81db49195a1fc5a3059c0a8871129dc0e8e72b231bb2dbb2a7d4"
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
