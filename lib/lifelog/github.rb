class Lifelog
  class Github

    def today
      all_repos.inject([]) do |result, repo|
        commits = commit_summary(repo.sub(/.*\//, ''), date_utc(Date.today.to_s))
        result << { repo: repo, commits: commits } unless commits.nil?
        result
      end
    end

    def all_repos
      client.repositories.inject([]) { |result, repo| result << repo.full_name }
    end

    def commit_summary(repo, date)
      api_response = client.commits_on("#{client.user.name}/#{repo}", date)
      return if api_response.empty?

      api_response.inject([]) do |result, response|
        result << { url: response.rels[:html].href, message: response.commit[:message] }
      end.reverse
    end

    def date_utc date
      DateTime.parse("#{date} 00:00:00 JST").to_time.utc
    end
  end
end
