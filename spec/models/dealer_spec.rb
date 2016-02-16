require 'rails_helper'


describe Cards::Dealer do

  subject { initialize :dealer }

  describe :object do
    deck = Cards::Deck.new
    dealer = Cards::Dealer.new

    it 'must shuffle cards in deck' do
      st_arr = Cards::Deck.new
      dealer.shuffle_deck deck

      expect(st_arr.cards.count).to eq(deck.cards.count)
      expect(st_arr.cards).to match_array(deck.cards)
    end

  end

end
