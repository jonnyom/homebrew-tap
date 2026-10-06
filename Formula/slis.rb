class Slis < Formula
  desc "Multi-repo worktree cockpit: a TUI + CLI for working across many git repos at once"
  homepage "https://github.com/jonnyom/slis"
  version "0.14.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_arm64.tar.gz"
      sha256 "b030dd8ee997e14241575b66b2a3c0eeaa6e9fc97e1b79a10bf1b572d39ec824"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_amd64.tar.gz"
      sha256 "58e013b56ee822a980c85f9a374a4f040063a6717f366574807f71e6c71f80a9"
    end
    depends_on "terminal-notifier"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_arm64.tar.gz"
      sha256 "e8edd7a26146a83d326eb7dfafb46636dd1baa4e1d356498fca6a02080922dd5"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_amd64.tar.gz"
      sha256 "056fbe53a1bcf2bd20f6880b45300764e12a75e91a3caee01cf8d8d24e714f06"
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
