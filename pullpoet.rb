class Pullpoet < Formula
  desc "Generate AI-powered pull request descriptions by analyzing git diffs"
  homepage "https://github.com/erkineren/pullpoet"
  url "https://github.com/erkineren/pullpoet/archive/v1.3.2.tar.gz"
  sha256 "476967976df0de07e05072d22f2e2532dbcef6ad10b3079bb64aaf9acb3897a9"
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
