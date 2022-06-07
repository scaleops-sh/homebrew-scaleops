# frozen_string_literal: true

require "download_strategy"

# GitHubPrivateRepositoryDownloadStrategy downloads contents from GitHub
# Private Repository. To use it, add
# `:using => :github_private_repo` to the URL section of
# your formula. This download strategy uses GitHub access tokens (in the
# environment variables `SCALEOPS_TOKEN`) to sign the request.  This
# strategy is suitable for corporate use just like S3DownloadStrategy, because
# it lets you use a private GitHub repository for internal distribution.  It
# works with public one, but in that case simply use CurlDownloadStrategy.
class GitHubPrivateRepositoryDownloadStrategy < CurlDownloadStrategy
  require "utils/formatter"

  def initialize(url, name, version, **meta)
    super
    set_github_token
    parse_url_pattern
  end

  def parse_url_pattern
    match = url.match(%r{https://github.com/([^/]+)/([^/]+)/(\S+)})
    raise CurlDownloadStrategyError, "Invalid url pattern for Scaleops." unless match

    _, @owner, @repo, @filepath = *match
  end

  def download_url
    "https://#{@github_token}@github.com/#{@owner}/#{@repo}/#{@filepath}"
  end

  private

  def _fetch(url:, resolved_url:, timeout:)
    curl_download download_url, to: temporary_path
  end

  def set_github_token
    @github_token = ENV.fetch("HOMEBREW_SCALEOPS_TOKEN")
    # rubocop:disable Layout/LineLength
    raise CurlDownloadStrategyError, "Environmental variable HOMEBREW_SCALEOPS_TOKEN is required." unless @github_token
  end
end

# GitHubPrivateRepositoryReleaseDownloadStrategy downloads tarballs from GitHub
# Release assets. To use it, add `:using => :github_private_release` to the URL section
# of your formula. This download strategy uses GitHub access tokens (in the
# environment variables SCALEOPS_TOKEN) to sign the request.
class GitHubPrivateRepositoryReleaseDownloadStrategy < GitHubPrivateRepositoryDownloadStrategy
  def parse_url_pattern
    url_pattern = %r{https://github.com/([^/]+)/([^/]+)/releases/download/([^/]+)/(\S+)}
    raise CurlDownloadStrategyError, "Invalid url pattern for Scaleops Release." unless url_pattern.match(@url)

    _, @owner, @repo, @tag, @filename = *@url.match(url_pattern)
  end

  def download_url
    "https://api.github.com/repos/#{@owner}/#{@repo}/releases/assets/#{asset_id}"
  end

  private

  def _fetch(url:, resolved_url:, timeout:)
    # HTTP request header `Accept: application/octet-stream` is required.
    # Without this, the GitHub API will respond with metadata, not binary.
    # rubocop:disable Layout/LineLength
    args = [
      download_url, "--header", "Accept: application/octet-stream", "--header", "Authorization: token #{@github_token}"
    ]
    curl_download(*args, to: temporary_path)
  end

  def asset_id
    @asset_id ||= resolve_asset_id
  end

  def resolve_asset_id
    release_metadata = fetch_release_metadata
    assets = release_metadata["assets"].select { |a| a["name"] == @filename }
    raise CurlDownloadStrategyError, "Asset file not found." if assets.empty?

    assets.first["id"]
  end

  def fetch_release_metadata
    release_url = "https://api.github.com/repos/#{@owner}/#{@repo}/releases/tags/#{@tag}"
    # rubocop:disable Layout/LineLength
    result = curl release_url, "--header", "Accept: application/vnd.github.v3+json", "--header", "Authorization: token #{@github_token}", show_output: false, print_stdout: false, print_stderr: false
    JSON.parse!(result.stdout)
  end
end
