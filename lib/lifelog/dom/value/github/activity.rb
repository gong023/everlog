class Lifelog
  class Dom::Value::Github::Repository_Activity < Dom::Value::Github
    include Maybe

    def initialize(repo_name, repo_commits)
      @repo_name = repo_name
      @commits = repo_commits
    end

    def repo_name
      maybe(@repo_name).to_s
    end

    def commits
      maybe(@commits).to_a
    end
  end
end
