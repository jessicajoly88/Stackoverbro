Rails.application.routes.draw do
  root :to => 'posts#index'

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  get "/posts" => "posts#show"

  resources :users do
    resources :posts
  end

  resources :users do
    resources :answers
  end


end
