class Pullpoet < Formula
  desc "Generate AI-powered pull request descriptions by analyzing git diffs"
  homepage "https://github.com/erkineren/pullpoet"
  url "https://github.com/erkineren/pullpoet/archive/v1.2.4.tar.gz"
  sha256 "3027384b49681731314a4a9cd8866105d96ef0233c081881bceed516ed1ecf37"
  license "MIT"
  head "https://github.com/erkineren/pullpoet.git", branch: "main"

  depends_on "go" => :build

  def install
    version_string = "-X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: "-s -w #{version_string}"), "./cmd"
  end

  test do
    assert_match "pullpoet", shell_output("#{bin}/pullpoet --help")
  end
end
