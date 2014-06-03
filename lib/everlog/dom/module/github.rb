class Everlog
  class Dom::Module::Github < Dom::Module
    class << self
      def fetch_since date
        @config = Dom::Entity::Config.moves
        repo_names.map { |r| repo_activity(r, date) }.compact
      end

      def api_client
        @api_client ||= Inf::Api::Github.new(@config)
      end

      def repo_names
        api_client.repos.map { |r| r.full_name }
      end

      def repo_activity(repo_name, date)
        repo_commits = commits(repo_name.sub(/.*\//, ''), date)
        return nil if repo_commits.nil?
        Dom::Value::Github::Repository_Activity.new(repo_name, repo_commits)
      end

      def commits(repo, date)
        response = api_client.commits_on(repo, date)
        return nil if response.empty?
        response.map { |r| Dom::Value::Github::Commit.new(r) }.reverse
      end
    end
  end
end
