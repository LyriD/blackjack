require 'rails_helper'


describe Cards::Deck do

  subject { initialize :card }

  describe :object do

    it 'must return a 52 cards array' do
      cards = Cards::Deck.new.cards
      expect(cards.class).to eq(Array)
      expect(cards.count).to eq(52)
    end

    # it 'must return a 52 cards array' do
    #   suits = %w(червы трефы пики бубны)
    #   ranks = %w(туз двойка тройка четверка пятерка шестерка семерка
    #            восьмерка девятка десятка валет дама король)
    #
    #
    #   cards = Cards::Deck.new.cards
    #   expect(cards.class).to eq(Array)
    #   expect(cards.count).to eq(52)
    # end

  end

end
