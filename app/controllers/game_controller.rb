class GameController < ApplicationController

  GAME_METHODS = %w(stake take_card double_bet stay reset_session)

  def blackjack


  end



  def move

    send params[:method].to_sym if GAME_METHODS.include? params[:method]

    render 'blackjack'

  end


  def card_to_hand


    session[:hand].draw(session[:deck], 2)
    session[:dealer].draw(session[:deck], 2)


    render 'blackjack'

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


end