class Everlog
  class Inf::Api::Github < Inf::Api
    require 'octokit'

    def client
      @client ||= Octokit::Client.new(access_token: @config.access_secret)
    end

    def repos
      client.repositories
    rescue => e
      raise InfrastructureGithubError, "repos error / #{e.message}"
    end

    def commits_on(repo, date)
      client.commits_on("#{client.user.name}/#{repo}", utc_from_jst(date))
    rescue => e
      raise InfrastructureGithubError, "commits_on error / #{e.message}"
    end

    private
    def utc_from_jst date
      DateTime.parse("#{date} 00:00:00 JST").to_time.utc
    end
  end

  class InfrastructureGithubError < StandardError; end
end
