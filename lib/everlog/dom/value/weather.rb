class Everlog
  class Dom::Value::Weather < Dom::Value
    include Maybe

    def max_temp
      maybe(tempms.each.max).to_i
    end

    def min_temp
      maybe(tempms.each.min).to_i
    end

    def condition
      cond = maybe(icons.each.max).to_s
      cond == 'unknown' ? 'sunny' : cond
    end

    private
    def tempms
      select_observations { |r| r['tempm'].to_f }
    end

    def icons
      select_observations { |r| r['icon'] }
    end

    def select_observations &parameter
      maybe(@response)['observations'].to_a.map { |r| parameter.call(r) }
    end
  end
end
