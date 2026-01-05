class ClaudeSessionExport < Formula
  desc "Transform Claude Code sessions into shareable HTML documentation"
  homepage "https://github.com/robzolkos/claude-session-export"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/robzolkos/claude-session-export/releases/download/v0.8.0/claude-session-export_0.8.0_darwin_amd64.tar.gz"
      sha256 "4d6f5e9a153e9c4c4ee803656ddab7206db9f29ce35ce4979d5c45c5a09bbd34"
    end
    on_arm do
      url "https://github.com/robzolkos/claude-session-export/releases/download/v0.8.0/claude-session-export_0.8.0_darwin_arm64.tar.gz"
      sha256 "e9c0044281054d4f679945f596a2a345821fc8962ee69a54f4a8526f967cb165"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/robzolkos/claude-session-export/releases/download/v0.8.0/claude-session-export_0.8.0_linux_amd64.tar.gz"
      sha256 "d498fe8643dd8b0c9a57d3718e6bc8b48feaf6b01e614ad38833fcdaed257fd8"
    end
    on_arm do
      url "https://github.com/robzolkos/claude-session-export/releases/download/v0.8.0/claude-session-export_0.8.0_linux_arm64.tar.gz"
      sha256 "337725ecb0d6d056b71d09dfaa1e965e624ef2a200d2bb478ff691fc38c31454"
    end
  end

  def install
    bin.install "claude-session-export"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-session-export --version")
  end
end
