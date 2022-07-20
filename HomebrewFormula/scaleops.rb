# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Scaleops < Formula
  desc "CLI"
  homepage "https://scaleops.sh/"
  version "0.0.95"
  license "Private"

  on_macos do
    url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.95/scaleops_0.0.95_darwin_all.tar.gz"
    sha256 "c4a6a58a8ed9010f2e758d3a4cc77c207c521f62cf497391fb49d33ca3fadbe5"

    def install
      bin.install "scaleops"
      (bash_completion/"scaleops").write `#{bin}/scaleops completion bash`
      (fish_completion/"scaleops.fish").write `#{bin}/scaleops completion fish`
      (zsh_completion/"_scaleops").write `#{bin}/scaleops completion zsh`
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.95/scaleops_0.0.95_linux_arm64.tar.gz"
      sha256 "a3a250f23c1c5e75d80cb03e033d39401d7951e1c79a05afc99093e3dc594a97"

      def install
        bin.install "scaleops"
        (bash_completion/"scaleops").write `#{bin}/scaleops completion bash`
        (fish_completion/"scaleops.fish").write `#{bin}/scaleops completion fish`
        (zsh_completion/"_scaleops").write `#{bin}/scaleops completion zsh`
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.95/scaleops_0.0.95_linux_amd64.tar.gz"
      sha256 "1fa6d39fa96f9962ea19608f437b7a8581303932f11a46a65a3f77da7a272f38"

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
