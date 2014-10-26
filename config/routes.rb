Whist::Application.routes.draw do

  devise_for :users, :controllers => { :invitations => 'users/invitations' }
  get "players/find" => 'players#find'
  resources :games
  # resources :hands
  get 'hands/finish/:id' => 'hands#finish', as: 'finish_hand'
  get 'game/:g_id/round/:seq' => 'hands#show'
  get 'games/list/:qstatus' => 'games#by_status', as: 'game_list'
  get 'record_bid/:hand_player_id' => 'hand_players#bid', as: 'record_bid'
  post 'record_bid/createbid' => 'hand_players#createbid'
  root to: "root#index"

end
