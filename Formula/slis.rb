class Slis < Formula
  desc "Multi-repo worktree cockpit: manage feature slices across repos"
  homepage "https://github.com/jonnyom/slis"
  head "https://github.com/jonnyom/slis.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-s -w -X github.com/jonnyom/slis/internal/cli.Version=head", "-o", bin/"slis", "./cmd/slis"
  end

  test do
    assert_match "slis", shell_output("#{bin}/slis --help 2>&1")
  end
end
