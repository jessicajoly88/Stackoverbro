Rails.application.routes.draw do
  root :to => 'posts#index'

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  resources :posts do
    resources :answers
  end

  resources :users

end
