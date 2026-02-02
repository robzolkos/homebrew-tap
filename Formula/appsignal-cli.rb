class AppsignalCli < Formula
  desc "CLI for AppSignal error monitoring"
  homepage "https://github.com/robzolkos/appsignal-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/robzolkos/appsignal-cli/releases/download/v#{version}/appsignal-darwin-arm64"
      sha256 "938aac9ee5a2a7934535c4395d8d4e8fccd11c929ee1c4b302b4245647f7f58f"
    else
      url "https://github.com/robzolkos/appsignal-cli/releases/download/v#{version}/appsignal-darwin-amd64"
      sha256 "5ae9ea3702b57d32287ab0821e4fd2db0cdb1d64690ab549418f5ad696697343"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/robzolkos/appsignal-cli/releases/download/v#{version}/appsignal-linux-arm64"
      sha256 "c7550de4cb27b6674419112e01c99497e36d9d7e1b59291d071ecbfc82a7d462"
    else
      url "https://github.com/robzolkos/appsignal-cli/releases/download/v#{version}/appsignal-linux-amd64"
      sha256 "ba16d995ee3a1669391bd75a5b9dcfab09951136d3e6d9a03c67cb029599739f"
    end
  end

  def install
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "appsignal-darwin-arm64" : "appsignal-darwin-amd64"
    else
      binary_name = Hardware::CPU.arm? ? "appsignal-linux-arm64" : "appsignal-linux-amd64"
    end
    bin.install binary_name => "appsignal"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/appsignal --version")
  end
end
