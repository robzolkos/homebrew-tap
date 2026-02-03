class RollbarCli < Formula
  desc "CLI for reading and listing Rollbar items and occurrences"
  homepage "https://github.com/robzolkos/rollbar-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/robzolkos/rollbar-cli/releases/download/v#{version}/rollbar-darwin-arm64"
      sha256 "d6115738f95016a19bcc347d06872cd6275cf667c1b6248cf1f89c2f87e36592"
    else
      url "https://github.com/robzolkos/rollbar-cli/releases/download/v#{version}/rollbar-darwin-amd64"
      sha256 "0392b8d252aea4e6db9b8e2a6ea59f2564483790a4c6838d779665e4ac24c839"
    end
  end

  def install
    binary_name = Hardware::CPU.arm? ? "rollbar-darwin-arm64" : "rollbar-darwin-amd64"
    bin.install binary_name => "rollbar"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rollbar --version")
  end
end
