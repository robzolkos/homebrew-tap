class RollbarCli < Formula
  desc "CLI for reading and listing Rollbar items and occurrences"
  homepage "https://github.com/robzolkos/rollbar-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/robzolkos/rollbar-cli/releases/download/v#{version}/rollbar-darwin-arm64"
      sha256 "3a93d7699bb7e0466c6273b84be4da7c131ea902db977e5a8e5e808f25bd3b38"
    else
      url "https://github.com/robzolkos/rollbar-cli/releases/download/v#{version}/rollbar-darwin-amd64"
      sha256 "0356632c9aa387660eab750e5cdec3e2200c6efc722010bd0378b31001539b71"
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
