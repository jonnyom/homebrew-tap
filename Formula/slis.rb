class Slis < Formula
  desc "Multi-repo worktree cockpit: a TUI + CLI for working across many git repos at once"
  homepage "https://github.com/jonnyom/slis"
  version "0.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_arm64.tar.gz"
      sha256 "0b06d8f0e99ea44c080308ac8870eef1d10151bf1c274dbbeea5cb83ea0b69fe"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_darwin_amd64.tar.gz"
      sha256 "37a4f2ca4e14bc113e3044a0a28653f5ab5a6495127488efd57b0f36520fc508"
    end
    depends_on "terminal-notifier"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_arm64.tar.gz"
      sha256 "d6478f77e54cd4864a50b499d331b2f3f84956bb53ed78b9f0b03edc18fc39f9"
    else
      url "https://github.com/jonnyom/slis/releases/download/v#{version}/slis_#{version}_linux_amd64.tar.gz"
      sha256 "b231e1e473be2037cce1eff659a39cf8b780e57aeee5b5e307a42c0ea5a0c12f"
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
