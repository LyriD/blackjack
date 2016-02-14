module Cards

  class Deck

    include Enumerable
    extend Forwardable

    SUITS = %w(червы трефы пики бубны)
    RANKS = %w(туз двойка тройка четверка пятерка шестерка семерка
               восьмерка девятка десятка валет дама король)

    attr_reader :cards

    def_delegators :cards, :empty?, :[], :shift

    alias :draw :shift

    def initialize
      @cards = build_deck
    end


  private

    def build_deck
      all_ranks.flat_map {|rank| SUITS.flat_map {|suit| Card.new(rank,suit) } }
    end

    def all_ranks
      RANKS.map.with_index {|rank, value| Rank.new(rank, value) }
    end

  end

end
