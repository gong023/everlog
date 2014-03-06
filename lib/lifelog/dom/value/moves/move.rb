class Lifelog
  class Dom::Value::Moves::Move < Dom::Value::Moves
    include Maybe

    def action
      maybe(@response['activity']).to_s
    end

    def duration
      round_off((maybe(@response['duration']).to_f / 60) % 60)
    end

    def start_time
      parse_to_His(pick_today(maybe(@response['startTime'].to_s)))
    end

    def end_time
      parse_to_His(pick_today(maybe(@response['endTime'].to_s)))
    end

    def distance
      maybe(@response['distance']).to_f / km
    end

    private
    def pick_today response
      DateTime.parse(response).to_time.to_s
    end

    def parse_to_His date
      date.sub(/\d{4}-\d{2}-\d{2}\ /, '').match(/\d{2}:\d{2}/).to_s
    end
  end
end
