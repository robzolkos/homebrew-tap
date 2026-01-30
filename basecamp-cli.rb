class BasecampCli < Formula
  desc "CLI for interacting with Basecamp projects and card tables"
  homepage "https://github.com/robzolkos/basecamp-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/robzolkos/basecamp-cli/releases/download/v#{version}/basecamp-darwin-arm64"
      sha256 "dbdbd2d3c9fedc1bcd0b5ee16cd7a3babd9a66003e29a2171c2e2eeaef8b69e5"
    else
      url "https://github.com/robzolkos/basecamp-cli/releases/download/v#{version}/basecamp-darwin-amd64"
      sha256 "8a10a0e989112378ff1d5f04b45d289997c86f19ae4418f26ebb67625326f9e7"
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
