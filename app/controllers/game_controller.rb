class GameController < ApplicationController

  GAME_METHODS = %w(stake take_card double_bet stay reset_session)

  def blackjack; end

  def move
    send params[:method].to_sym if GAME_METHODS.include? params[:method]
    redirect_to root_path
  end


  private


  def stake
      if deck.cards.count > 3
        dealer.draw(deck, 2) if gamer.stake_sum(deck, 2, params[:sum].to_i)
      else
        flash[:notice] = I18n.t 'deck.empty'
      end
  end

  def double_bet
    gamer.double_bet
  end

  def take_card
    gamer.draw(deck, 1)
    if gamer.status == :loose
      dealer.pass_cards
      flash[:notice] = I18n.t 'gamer.loose'
    end
  end

  def stay
    flash[:notice] = I18n.t "gamer.#{dealer.end_round(deck, gamer)}"
  end


end