require 'rails_helper'


describe Cards::Hand do

  subject { initialize :hand }

  describe :object do
    deck = Blackjack::Deck.new
    hand = Cards::Hand.new

    it 'draw four cards to hand' do
      hand.draw(deck, 4)
      expect(hand.cards.count).to eq(4)
      expect(deck.cards.count).to eq(48)
    end

    it 'check card sum (4x Ace)' do
      expect(hand.sum).to eq(44)
    end



  end

end
