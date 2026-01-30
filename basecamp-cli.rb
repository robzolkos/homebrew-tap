class BasecampCli < Formula
  desc "CLI for interacting with Basecamp projects and card tables"
  homepage "https://github.com/robzolkos/basecamp-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/robzolkos/basecamp-cli/releases/download/v#{version}/basecamp-darwin-arm64"
      sha256 "911cf4c545a8ed8bcd1c5b21d420347327bd00fa3efdeb7499fc3b20978f6586"
    else
      url "https://github.com/robzolkos/basecamp-cli/releases/download/v#{version}/basecamp-darwin-amd64"
      sha256 "73eab26bdf5084c3cfb347ab675ce205158a766251d051fcc5dd9be10e44e7ae"
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
