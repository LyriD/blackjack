module Cards
  class Gamer < Hand

    attr_reader :balance
    attr_reader :stake


    def initialize(cards = [])
      @balance = 1000
      @stake = 0
      super
    end

    def stake_sum(deck, n, sum)
      return false if @balance < sum or sum <= 0
      self.draw(deck, n)
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
      self.pass_cards
    end

    def loose
      @stake = 0
      self.pass_cards
      false
    end

    def status
      (sum > 21)? self.loose : true
    end

  end
end
