class RollbarCli < Formula
  desc "CLI for reading and listing Rollbar items and occurrences"
  homepage "https://github.com/robzolkos/rollbar-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/robzolkos/rollbar-cli/releases/download/v#{version}/rollbar-darwin-arm64"
      sha256 "abf07446d07e266f843934cdf8f23a6e1c9c91117bb552089caed45fe0e49238"
    else
      url "https://github.com/robzolkos/rollbar-cli/releases/download/v#{version}/rollbar-darwin-amd64"
      sha256 "975b17c241036a4a7d759c9bcae9267c1ec31336f43a181ef3d97566b2cd3659"
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
