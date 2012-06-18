Videochat::Application.routes.draw do
  root :to => 'sessions#new'
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  
  resources :users
  resources :sessions
  resources :languages
  resources :courses do
    resources :stories
  end
  resources :posts do
    resources :comments
  end
  
  match '/conversation' => 'conversations#newroom'
  match '/contact' => 'pages#contact'
  match '/room' => 'pages#room'
  match '/newsession' => 'pages#newsession'
  match '/skills' => 'pages#skill'
end
