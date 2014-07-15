Whist::Application.routes.draw do

  get "hand_players/new"
 post "hand_players/create"
  resources :games
  resources :hand_players
 #  get 'games/orig_new' => 'games#setup'
 # post 'games/create' => 'games#start'
  get '/', to: 'root#index', as: :root
end
