class Slis < Formula
  desc "Multi-repo worktree cockpit: a TUI + CLI for working across many git repos at once"
  homepage "https://github.com/jonnyom/slis"
  version "0.12.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_arm64.tar.gz"
      sha256 "b6688258377c99dcef88c7b1e4b4fe8e30ca704fae3caef184a5d16286320a4c"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_amd64.tar.gz"
      sha256 "54188579cae45c5151676f90168c39e8dbc5d28791ad328c83b208a356421865"
    end
    depends_on "terminal-notifier"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_arm64.tar.gz"
      sha256 "7249d84065fd7fbe281803ff256bcc1ae8af4c3be1efc89206f6d30bc520c6d4"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_amd64.tar.gz"
      sha256 "04bb922ed422d613c691db7c8fd695dc3e9dbb1735c742a189c6c299e5adfd76"
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
