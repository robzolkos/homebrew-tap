class BasecampCli < Formula
  desc "CLI for interacting with Basecamp projects and card tables"
  homepage "https://github.com/robzolkos/basecamp-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/robzolkos/basecamp-cli/releases/download/v#{version}/basecamp-darwin-arm64"
      sha256 "eb964a69de68115505391b87e0f5c027722ed33b5e9178bfce17aaa96fc4c95c"
    else
      url "https://github.com/robzolkos/basecamp-cli/releases/download/v#{version}/basecamp-darwin-amd64"
      sha256 "1e105771e1408c09e49eb727f2b12645115849f92a5ee065bebfb328cf607aa2"
    end
  end

  def install
    binary_name = Hardware::CPU.arm? ? "basecamp-darwin-arm64" : "basecamp-darwin-amd64"
    bin.install binary_name => "basecamp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/basecamp --version")
  end
end
