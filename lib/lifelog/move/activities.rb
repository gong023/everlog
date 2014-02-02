class Lifelog
  class Moves
    class ActivityFactory
      def self.build(table)
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
      def initialize(table)
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
  end
end
