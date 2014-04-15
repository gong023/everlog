class Everlog
  class Dom::Value::Moves::Move < Dom::Value::Moves
    include Maybe

    def action
      maybe(@response['activity']).to_s
    end

    def duration
      duration = maybe(@response['duration'])
      round_off((duration.to_f / 60))
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
  end
end
