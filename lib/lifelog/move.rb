class Lifelog
  class Moves
    require 'moves'
    require 'active_support/core_ext/object/try'
    require 'activities'

    def client
      @client ||= ::Moves::Client.new(ENV['moves_access_token'])
    end

    def today
    end

    def storyline
      api_result = client.daily_storyline
    end

    def summary
      api_result = client.daily_summary.first

      activities = api_result['summary'].inject({}) do |table, summary|
        activity = ActivityFactory.build(summary)
        table.merge(activity.name => activity)
      end

      {
        summary: {
          cal: activities.values.map(&:calorie).inject(:+),
          walk: activities["walk"].try(:distance) || 0,
          trp: activities["transport"].try(:distance) || 0,
          cycle: activities["cycle"].try(:distance) || 0,
        }
      }
    end
  end
end
