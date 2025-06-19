class Pullpoet < Formula
  desc "Generate AI-powered pull request descriptions by analyzing git diffs"
  homepage "https://github.com/erkineren/pullpoet"
  url "https://github.com/erkineren/pullpoet/archive/v1.2.6.tar.gz"
  sha256 "3d1dbdd7981ce1cab7af99765f597f8ad7e28f21e6d928de801847a471fb42ec"
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
