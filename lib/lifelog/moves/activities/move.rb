class Lifelog
  class Moves
    class Move < Activity
      def to_a
        @table['activities'].map do |act|
          {
            'action' => act['activity'],
            'time' => time(act),
            'distance' => distance(act),
          }
        end
      end

      def time act
        minutes = (act['duration'] / 60) % 60
        start_time = parse_to_His(pick_today(act['startTime']))
        end_time = parse_to_His(pick_today(act['endTime']))
        "#{start_time} ~ #{end_time} (#{minutes}min)"
      end

      def distance act
        "#{act['distance'].to_f / 1000}km"
      end

      private
      def pick_today response
        (DateTime.parse(response).to_time + 3600*9).to_s
      end

      def parse_to_His date
        date.sub(/\d{4}-\d{2}-\d{2}\ /, '').match(/\d{2}:\d{2}:\d{2}/).to_s
      end
    end
  end
end
