
module Cards
  class Dealer < Hand


    def shuffle_deck(deck)

      deck.cards.shuffle!
      deck

    end


  end
end
