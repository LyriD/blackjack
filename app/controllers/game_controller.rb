class GameController < ApplicationController

  GAME_METHODS = %w(stake take_card double_bet stay reset_session)

  def blackjack; end

  def move
    send params[:method].to_sym if GAME_METHODS.include? params[:method]
    redirect_to root_path
  end





  private


  def stake
    hand.draw(deck, 2)
    dealer.draw(deck, 2)
    hand.stake=params[:sum].to_i
  end

  def double_bet
    hand.double_bet
  end

  def take_card
    hand.draw(deck, 1)
  end

  def stay
    dealer.end_round(deck, hand)
  end


end