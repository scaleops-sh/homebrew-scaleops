# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Scaleops < Formula
  desc "CLI"
  homepage "https://scaleops.sh/"
  version "0.0.26"
  license "Private"

  on_macos do
    url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.26/scaleops_0.0.26_darwin_all.tar.gz"
    sha256 "8dea6963b10191c261967507a1fd062e5b143836ef9ddea647e674d1bfb0c652"

    def install
      bin.install "scaleops"
      (bash_completion/"scaleops").write `#{bin}/scaleops completion bash`
      (fish_completion/"scaleops.fish").write `#{bin}/scaleops completion fish`
      (zsh_completion/"_scaleops").write `#{bin}/scaleops completion zsh`
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.26/scaleops_0.0.26_linux_amd64.tar.gz"
      sha256 "a7a8bff0d69b12f57ccb5b6ce0b937ed53d3693a4b7f9b2a3ba4911fb335fa29"

      def install
        bin.install "scaleops"
        (bash_completion/"scaleops").write `#{bin}/scaleops completion bash`
        (fish_completion/"scaleops.fish").write `#{bin}/scaleops completion fish`
        (zsh_completion/"_scaleops").write `#{bin}/scaleops completion zsh`
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.26/scaleops_0.0.26_linux_arm64.tar.gz"
      sha256 "9f88447e5667ad3bb98791bb24a130d6051c765d22c250d695a8d60ecf248ff7"

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
