module Cards

  class Card < Value.new(:rank, :suit)
    def suit
      (@suit || 'naked').to_sym
    end

    def to_s
      "#{suit.to_s.capitalize} - #{rank.to_s}"
    end
  end

end
