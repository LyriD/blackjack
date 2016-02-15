module ObjectsHelper

  def hand
    session[:hand] ||= Cards::Hand.new
  end

  def dealer
    session[:dealer] ||= Cards::Dealer.new
  end

  def deck
    session[:deck] ||= session[:dealer].shuffle_deck Cards::Deck.new
  end

end
