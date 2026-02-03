class RollbarCli < Formula
  desc "CLI for reading and listing Rollbar items and occurrences"
  homepage "https://github.com/robzolkos/rollbar-cli"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/robzolkos/rollbar-cli/releases/download/v#{version}/rollbar-darwin-arm64"
      sha256 "af5cc92e94c12984715557a5619d59012fa73e25092583a0b879ccfcb79878bb"
    else
      url "https://github.com/robzolkos/rollbar-cli/releases/download/v#{version}/rollbar-darwin-amd64"
      sha256 "28523980b0c910a228595a7ffd410a01b92d298c3149d65deaed3fcc88a86e9a"
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
