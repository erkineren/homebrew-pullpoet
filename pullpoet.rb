class Pullpoet < Formula
  desc "Generate AI-powered pull request descriptions by analyzing git diffs"
  homepage "https://github.com/erkineren/pullpoet"
  url "https://github.com/erkineren/pullpoet/archive/v1.1.0.tar.gz"
  sha256 "912667c593028de84a1042b6174c5dba75a0a5cbeeb7b31d9a5e0d417acabc7c"
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