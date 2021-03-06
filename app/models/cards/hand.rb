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

    def sum
      self.cards.inject(0) {|sum, hash| sum + hash.rank.value}
    end

    def sort!
      @cards.sort!
      self
    end

    def draw(deck, n = 1)
      n.times do
        @cards << deck.draw unless deck.empty?
      end if deck.cards.count >= n
      self
    end

    def pass_cards
      @cards = []
    end

    def each(&block)
      @cards.each(&block)
    end

  end
end
