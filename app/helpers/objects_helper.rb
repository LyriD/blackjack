module ObjectsHelper

  def gamer
    session[:gamer] ||= Cards::Gamer.new
  end

  def dealer
    session[:dealer] ||= Cards::Dealer.new
  end

  def deck
    session[:deck] ||= dealer.shuffle_deck Blackjack::Deck.new
  end

end
