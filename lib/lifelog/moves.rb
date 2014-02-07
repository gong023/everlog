class Lifelog
  class Moves
    require 'moves'
    require 'active_support/core_ext/object/try'
    require 'lifelog/moves/activities'

    def client
      @client ||= ::Moves::Client.new(ENV['moves_access_token'])
    end

    def today
      { activity: storyline, summary: summary }
    end

    def storyline
      api_result = client.daily_storyline.first

      activities = api_result['segments'].inject([]) do |table, summary|
        build = ActivityFactory.build_storyline(summary)
        build.name == 'move' ? table << build.to_a : table << build.screen_name
      end

      storyline = []
      activities.each_with_index do |activity, i|
        storyline << { place: activity, move: activities[i + 1] } if i.even?
      end
      storyline
    end

    def summary
      api_result = client.daily_summary.first

      activities = api_result['summary'].inject({}) do |table, summary|
        activity = ActivityFactory.build_summary(summary)
        table.merge(activity.name => activity)
      end

      {
        cal: activities.values.map(&:calorie).inject(:+),
        walk: activities["walk"].try(:distance) || 0,
        trp: activities["transport"].try(:distance) || 0,
        cycle: activities["cycle"].try(:distance) || 0,
      }
    end
  end
end
