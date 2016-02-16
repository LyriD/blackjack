
module Cards
  class Dealer < Hand

    def shuffle_deck(deck)
      deck.cards.shuffle!
      deck
    end

    def end_round(deck, hand)
      while self.sum <= 17 and deck.cards.count > 0 do; self.draw(deck, 1); end
      return hand.standoff if self.sum == hand.sum
      gamer_status = (self.sum <= 21 and self.sum > hand.sum)?  hand.loose : hand.win; @cards = []
      return gamer_status
    end

  end
end