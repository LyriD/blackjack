
module Cards
  class Dealer < Hand

    def shuffle_deck(deck)
      deck.cards.shuffle!
      deck
    end

    def end_round(deck, hand)
      while self.sum < 17 do; self.draw(deck, 1); end
      (self.sum <= 21 and self.sum > hand.sum)? hand.loose : hand.win
      @cards = []
    end

  end
end

#cards sum draw
