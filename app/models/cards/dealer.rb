
module Cards::Dealer
  extend self

  def shuffle_deck(deck)

    deck.cards.shuffle!
    deck

  end



end
