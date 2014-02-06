class Lifelog
  class Moves
    class ActivityFactory
      def self.build_storyline(table)
        case table['type']
        when 'place'
          Place.new(table)
        when 'move'
          Move.new(table)
        end
      end

      def self.build_summary(table)
        case table['activity']
        when 'wlk'
          Walk.new(table)
        when 'run'
          # I do not use 'run'
          Run.new(table)
        when 'trp'
          Transport.new(table)
        when 'cyc'
          Cycle.new(table)
        end
      end
    end

    class Activity
      def initialize table
        @table = table
      end

      def calorie
        @table['calories'] || 0
      end

      def distance
        @table['distance'] || 0
      end

      def name
        self.class.name.split("::").last.downcase
      end
    end

    class Walk < Activity; end

    class Run < Activity; end

    class Cycle < Activity; end

    class Transport < Activity; end

    require 'place'

    class Move < Activity
      def to_a
        @table['activities'].map do |act|
          {
            action: act['activity'],
            time: time(act),
            distance: distance(act),
          }
        end
      end

      def time act
        minutes = (act['duration'] / 60) % 60
        start_time = parse_to_His(act['startTime'])
        end_time = parse_to_His(act['endTime'])
        "#{start_time} ~ #{end_time} (#{minutes}min)"
      end

      def distance act
        "#{act['distance'] % 1000}km"
      end

      private
      def parse_to_His time
        (DateTime.parse(time).to_time + 3600*9).to_s.sub(/\d{4}-\d{2}-\d{2}\ /, '').match(/\d{2}:\d{2}:\d{2}/).to_s
      end
    end
  end
end
