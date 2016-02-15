class GameController < ApplicationController

  GAME_METHODS = %w(stake take_card double_bet stay reset_session)

  def blackjack; end

  def move
    send params[:method].to_sym if GAME_METHODS.include? params[:method]
    redirect_to root_path
  end





  private


  def stake
      dealer.draw(deck, 2) if gamer.stake_sum(deck, 2, params[:sum].to_i)
  end

  def double_bet
    gamer.double_bet
  end

  def take_card
    gamer.draw(deck, 1)
    dealer.pass_cards unless gamer.status
  end

  def stay
    dealer.end_round(deck, gamer)
  end


end