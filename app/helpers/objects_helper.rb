module ObjectsHelper

  def hand
    session[:hand] ||= Cards::Hand.new
  end

  def dealer
    session[:dealer] ||= Cards::Dealer.new
  end

  def deck
    session[:deck] ||= dealer.shuffle_deck Blackjack::Deck.new
  end

end
