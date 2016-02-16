require 'rails_helper'


describe Cards::Gamer do

  subject { initialize :dealer }

  describe :object do
    gamer = Cards::Gamer.new
    deck = Cards::Dealer.new.shuffle_deck Blackjack::Deck.new
    it 'new game' do
      expect(gamer.balance).to eq(1000)
      expect(gamer.cards.class).to eq(Array)
    end

    it 'stake' do
      gamer.stake_sum(deck, 2, 200)
      expect(gamer.balance).to eq(800)
      expect(gamer.cards.count).to eq(2)
    end

    it 'double stake' do
      gamer.double_bet
      expect(gamer.balance).to eq(600)
      expect(gamer.stake).to eq(400)
    end

    it 'take card' do
      gamer.draw(deck, 1)
      expect(gamer.cards.count).to eq(3)
    end

  end

end
