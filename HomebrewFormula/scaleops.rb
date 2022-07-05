# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Scaleops < Formula
  desc "CLI"
  homepage "https://scaleops.sh/"
  version "0.0.34"
  license "Private"

  on_macos do
    url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.34/scaleops_0.0.34_darwin_all.tar.gz"
    sha256 "f9a77102ffa0451e5ccda6e97f31aeb875eae741be7dd2fa7c138b5640839418"

    def install
      bin.install "scaleops"
      (bash_completion/"scaleops").write `#{bin}/scaleops completion bash`
      (fish_completion/"scaleops.fish").write `#{bin}/scaleops completion fish`
      (zsh_completion/"_scaleops").write `#{bin}/scaleops completion zsh`
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.34/scaleops_0.0.34_linux_arm64.tar.gz"
      sha256 "0133a6cd0e85252f4a7002edf601c80d2b445b8643d30063a09705a60d9086bf"

      def install
        bin.install "scaleops"
        (bash_completion/"scaleops").write `#{bin}/scaleops completion bash`
        (fish_completion/"scaleops.fish").write `#{bin}/scaleops completion fish`
        (zsh_completion/"_scaleops").write `#{bin}/scaleops completion zsh`
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.34/scaleops_0.0.34_linux_amd64.tar.gz"
      sha256 "d4e2ac5627d3094c1e0b87404748c4d837a68f64506d4bb1d4b591b420691ded"

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
