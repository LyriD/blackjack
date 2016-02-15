module Cards
  class Hand

    include Enumerable
    extend Forwardable

    attr_reader :cards
    attr_reader :balance
    attr_reader :stake

    def_delegators :cards, :<<, :[]

    alias :add :<<

    def initialize(cards = [])
      @balance = 1000
      @stake = 0
      @cards = []
      cards.each do |card|
        self << card
      end
    end

    def stake=(sum)
      return unless @balance >= sum
      @balance -= sum
      @stake = sum
    end

    def double_bet
      return if @balance - @stake < 0
      @balance -= @stake
      @stake *= 2
    end


    def win
      @balance += @stake*2
    end

    def loose
      @stake = 0
      @cards = []
      false
    end

    def sum
      self.cards.inject(0) {|sum, hash| sum + hash.rank.value}
    end

    def status
      (sum > 21)? self.loose : true
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

    def pass_cards
      @cards = []
    end

    def each(&block)
      @cards.each(&block)
    end

  end
end
