class Slis < Formula
  desc "Multi-repo worktree cockpit: a TUI + CLI for working across many git repos at once"
  homepage "https://github.com/jonnyom/slis"
  version "0.13.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_arm64.tar.gz"
      sha256 "0872fe366eb610beae467fe3858a868a001db69dca95b84f8b9879cfd0f36d7d"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_amd64.tar.gz"
      sha256 "d3f525c2842d533b4821d97d1d11583e0703cd9ec7c44d1b474ed3ac9e31b315"
    end
    depends_on "terminal-notifier"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_arm64.tar.gz"
      sha256 "e3d768e7cc628284a401dacc12a7aff6af1231de71f36610368c39d013743744"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_amd64.tar.gz"
      sha256 "7a4a7f853d0a07df7fe019a91abb2f3c5e0713a896fd33700cdba18bde36085a"
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
