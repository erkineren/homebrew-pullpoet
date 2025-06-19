class Pullpoet < Formula
  desc "Generate AI-powered pull request descriptions by analyzing git diffs"
  homepage "https://github.com/erkineren/pullpoet"
  url "https://github.com/erkineren/pullpoet/archive/v1.2.5.tar.gz"
  sha256 "3f3499e0a44aeece05308523221dbe74b19fa845ca2a7f48d035fe35d44c43d8"
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
