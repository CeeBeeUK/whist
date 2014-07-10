Whist::Application.routes.draw do

  resources :games
 #  get 'games/new' => 'games#setup'
 # post 'games/create' => 'games#start'
  get '/', to: 'root#index', as: :root
end
