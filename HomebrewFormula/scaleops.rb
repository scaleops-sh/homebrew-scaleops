# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Scaleops < Formula
  desc "CLI"
  homepage "https://scaleops.sh/"
  version "0.0.67"
  license "Private"

  on_macos do
    url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.67/scaleops_0.0.67_darwin_all.tar.gz"
    sha256 "ae5f971b212e45349e7e5e1bd93e6d34c88f59d64b06c465e5417b8a8b3a04c7"

    def install
      bin.install "scaleops"
      (bash_completion/"scaleops").write `#{bin}/scaleops completion bash`
      (fish_completion/"scaleops.fish").write `#{bin}/scaleops completion fish`
      (zsh_completion/"_scaleops").write `#{bin}/scaleops completion zsh`
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.67/scaleops_0.0.67_linux_arm64.tar.gz"
      sha256 "de44777dc8d375ffacf046d39fb6d8ec7eca5989481a3997627f89b6dcf65bd2"

      def install
        bin.install "scaleops"
        (bash_completion/"scaleops").write `#{bin}/scaleops completion bash`
        (fish_completion/"scaleops.fish").write `#{bin}/scaleops completion fish`
        (zsh_completion/"_scaleops").write `#{bin}/scaleops completion zsh`
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.67/scaleops_0.0.67_linux_amd64.tar.gz"
      sha256 "075abaaab76535d0bea10594a09f06ef70e991b9f0c08b7deb448514aa997ca4"

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
