class Pullpoet < Formula
  desc "Generate AI-powered pull request descriptions by analyzing git diffs"
  homepage "https://github.com/erkineren/pullpoet"
  url "https://github.com/erkineren/pullpoet/archive/v1.2.0.tar.gz"
  sha256 "fc124c9ec45d0c5bd0b3883be3c982ad5cf261fe7d9d1674ef223dafe860ad89"
  license "MIT"
  head "https://github.com/erkineren/pullpoet.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd"
  end

  test do
    assert_match "pullpoet", shell_output("#{bin}/pullpoet --help")
  end
end 