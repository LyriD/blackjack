Rails.application.routes.draw do

  root 'game#blackjack'
  get 'move/(:method)' => 'game#move', as: :move

end
