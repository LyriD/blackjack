require 'values'

module Cards

  class Rank < Value.new(:rank, :value)
    def to_s
      rank.to_s.capitalize
    end
  end

end
