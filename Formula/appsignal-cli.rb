class AppsignalCli < Formula
  desc "CLI for AppSignal error monitoring"
  homepage "https://github.com/robzolkos/appsignal-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/robzolkos/appsignal-cli/releases/download/v#{version}/appsignal-cli-darwin-arm64"
      sha256 "2e2f9d9ba2bc89010e3c26c1068f4ecf78fdb4e5720ad819a4a10fde588a45aa"
    else
      url "https://github.com/robzolkos/appsignal-cli/releases/download/v#{version}/appsignal-cli-darwin-amd64"
      sha256 "b1312a27a14fd6af946b00b2e55de4c4ef50c564811a0eb2f118711c9cbf307d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/robzolkos/appsignal-cli/releases/download/v#{version}/appsignal-cli-linux-arm64"
      sha256 "d43797c79d6bf38d15d8232ecbc6aeb74d2889f37de4b8e86f638d351f8befa6"
    else
      url "https://github.com/robzolkos/appsignal-cli/releases/download/v#{version}/appsignal-cli-linux-amd64"
      sha256 "de6fa8afe3e0eb41c0b5e0b5def978cb801b88ffaa69288f403b601e45026c30"
    end
  end

  def install
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "appsignal-cli-darwin-arm64" : "appsignal-cli-darwin-amd64"
    else
      binary_name = Hardware::CPU.arm? ? "appsignal-cli-linux-arm64" : "appsignal-cli-linux-amd64"
    end
    bin.install binary_name => "appsignal-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/appsignal-cli --version")
  end
end
