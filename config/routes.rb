Whist::Application.routes.draw do

  devise_for :users, :controllers => { :invitations => 'users/invitations' }
  get "players/find" => 'players#find'
  get "hand_players/new/:id" => 'hand_players#new'
  post "hand_players/create/:id" => 'hand_players#create'
  resources :games
  resources :hand_players
  # resources :hands
  get 'hands/finish/:id' => 'hands#finish', as: 'finish_hand'
  get 'game/:g_id/round/:seq' => 'hands#show'
  # get 'games/orig_new' => 'games#setup'
  # post 'games/create' => 'games#start'
  #get '/', to: 'root#index', as: :root
  root to: "root#index"

end
