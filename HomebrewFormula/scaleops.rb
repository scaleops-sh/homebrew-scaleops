# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Scaleops < Formula
  desc "CLI"
  homepage "https://scaleops.sh/"
  version "0.0.25"
  license "Private"

  on_macos do
    url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.25/scaleops_0.0.25_darwin_all.tar.gz"
    sha256 "8f0c8df2fbd0e504251e09f90c7827754d1f214e3e89259a9aa62d2cbe358c97"

    def install
      bin.install "scaleops"
      (bash_completion/"scaleops").write `#{bin}/scaleops completion bash`
      (fish_completion/"scaleops.fish").write `#{bin}/scaleops completion fish`
      (zsh_completion/"_scaleops").write `#{bin}/scaleops completion zsh`
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.25/scaleops_0.0.25_linux_arm64.tar.gz"
      sha256 "81c9025d8192b504d25eb5d52f5d0406563cfa62db4b89db221e9a073b3a347f"

      def install
        bin.install "scaleops"
        (bash_completion/"scaleops").write `#{bin}/scaleops completion bash`
        (fish_completion/"scaleops.fish").write `#{bin}/scaleops completion fish`
        (zsh_completion/"_scaleops").write `#{bin}/scaleops completion zsh`
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.25/scaleops_0.0.25_linux_amd64.tar.gz"
      sha256 "319874bb7c5c3035753ff3cee1d7e5bdb03d6cbb7f52262694bce99b1a475a71"

      def install
        bin.install "scaleops"
        (bash_completion/"scaleops").write `#{bin}/scaleops completion bash`
        (fish_completion/"scaleops.fish").write `#{bin}/scaleops completion fish`
        (zsh_completion/"_scaleops").write `#{bin}/scaleops completion zsh`
      end
    end
  end

  depends_on "helm"
  depends_on "kubectl"
  depends_on "zsh" => :optional

  def caveats; <<~EOS
    Now get the token from scaleops.sh
    Then run:
      scaleops system install --token *****

    Note: To enjoy autocompletion please make sure to setup brew correctly https://docs.brew.sh/Shell-Completion
  EOS
  end
end
