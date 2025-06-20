class Pullpoet < Formula
  desc "Generate AI-powered pull request descriptions by analyzing git diffs"
  homepage "https://github.com/erkineren/pullpoet"
  url "https://github.com/erkineren/pullpoet/archive/v1.3.0.tar.gz"
  sha256 "a02ba932ce719cb66fd663da741fd0634bde46781b8f70d5aaeac14536cbb804"
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
