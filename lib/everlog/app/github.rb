class Everlog
  class App::Github < App
    def self.fetch_since(date)
      mod = Dom::Module::Github.new(Dom::Entity::Config.github)
      activities = mod.repo_names.map { |r| mod.repo_activity(r, date) }
      activities.compact
    end
  end
end
