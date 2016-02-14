module Cards
  class Hand

    include Enumerable
    extend Forwardable

    attr_reader :cards

    def_delegators :cards, :<<, :[]

    alias :add :<<

    def initialize(cards = [])
      @cards = []
      cards.each do |card|
        self << card
      end
    end

    def sort!
      @cards.sort!
      self
    end

    def draw(deck, n = 1)
      n.times do
        @cards << deck.draw unless deck.empty?
      end
      self
    end

    def each(&block)
      @cards.each(&block)
    end

  end
end
