class Slis < Formula
  desc "Multi-repo worktree cockpit: a TUI + CLI for working across many git repos at once"
  homepage "https://github.com/jonnyom/slis"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_arm64.tar.gz"
      sha256 "5213bd4dfff63e5347369c641e7576b628593c0e1f7bf34a2573b448c43c4331"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_amd64.tar.gz"
      sha256 "200031a84170d984251fa54d8a25d27f638136fc15f0f0f4b6a9f9de6e2c0ecf"
    end
    depends_on "terminal-notifier"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_arm64.tar.gz"
      sha256 "87d0a244bd52470cfb6d8929dd00dd6c331878c680b980114c0c2b0527bf174f"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_amd64.tar.gz"
      sha256 "9f04afacc5c4e2ff30b7cced3b8b23f6a52e95d4e19d89f204da26db68bfc778"
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
