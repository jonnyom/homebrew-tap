class Slis < Formula
  desc "Multi-repo worktree cockpit: a TUI + CLI for working across many git repos at once"
  homepage "https://github.com/jonnyom/slis"
  version "0.14.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_arm64.tar.gz"
      sha256 "a85e2dc01a4d55a1637faf4754480b3e7d707eadd8cd9aad958daed09c28f933"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_amd64.tar.gz"
      sha256 "c1c8057317a0523650f31f5d8871431cc20af8b434c8ceaca12ad72c9d4d4861"
    end
    depends_on "terminal-notifier"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_arm64.tar.gz"
      sha256 "6d65bbc3759333a27fcd6edd71d01abf9c4a368178826f5a761c627e8dc7f570"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_amd64.tar.gz"
      sha256 "ee8db91ed69def9bd73e4bca0037bdc6e8d04a0d9fa302666ded60533aca97ae"
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
