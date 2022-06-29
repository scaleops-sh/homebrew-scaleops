# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Scaleops < Formula
  desc "CLI"
  homepage "https://scaleops.sh/"
  version "0.0.24"
  license "Private"

  on_macos do
    url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.24/scaleops_0.0.24_darwin_all.tar.gz"
    sha256 "eca8a16575150aab9332942105e6ef4823e91e04ec909786018a6d35566b759c"

    def install
      bin.install "scaleops"
      (bash_completion/"scaleops").write `#{bin}/scaleops completion -s bash`
      (fish_completion/"scaleops.fish").write `#{bin}/scaleops completion -s fish`
      (zsh_completion/"_scaleops").write `#{bin}/scaleops completion -s zsh`
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.24/scaleops_0.0.24_linux_arm64.tar.gz"
      sha256 "f4301cf50866ac7cf76f5d12b4144aedc3c5161c72e45f8b588ba03933f4bb89"

      def install
        bin.install "scaleops"
        (bash_completion/"scaleops").write `#{bin}/scaleops completion -s bash`
        (fish_completion/"scaleops.fish").write `#{bin}/scaleops completion -s fish`
        (zsh_completion/"_scaleops").write `#{bin}/scaleops completion -s zsh`
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.24/scaleops_0.0.24_linux_amd64.tar.gz"
      sha256 "cee2f4628ebf6245c456892f75af5fa963732b72bd02f21b7af8e8d31d6b61bb"

      def install
        bin.install "scaleops"
        (bash_completion/"scaleops").write `#{bin}/scaleops completion -s bash`
        (fish_completion/"scaleops.fish").write `#{bin}/scaleops completion -s fish`
        (zsh_completion/"_scaleops").write `#{bin}/scaleops completion -s zsh`
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
