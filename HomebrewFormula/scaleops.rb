# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Scaleops < Formula
  desc "CLI"
  homepage "https://scaleops.sh/"
  version "0.0.21"
  license "Private"

  on_macos do
    url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.21/scaleops_0.0.21_darwin_all.tar.gz"
    sha256 "80912c9d5fcfb0c3047d622ee72904024bf61c6fbfad653973150d41f8bd1302"

    def install
      bin.install "scaleops"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.21/scaleops_0.0.21_linux_amd64.tar.gz"
      sha256 "ae2d9761ca170ce62d44669cd2d78cb91b195321b58e897a699d7152d63f9b33"

      def install
        bin.install "scaleops"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/scaleops-sh/scaleops-sh/releases/download/v0.0.21/scaleops_0.0.21_linux_arm64.tar.gz"
      sha256 "6c6652a9f67ebf0bca194abf0b59cbed93e87ffb9c3d092e5d7ad02f5f383fc6"

      def install
        bin.install "scaleops"
      end
    end
  end

  depends_on "helm"
  depends_on "kubectl"

  def caveats; <<~EOS
    Now get the token from scaleops.sh
    Then run:
      scaleops system install --token *****
  EOS
  end
end
