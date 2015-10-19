Rails.application.routes.draw do
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out
  root :to => 'users#index'

  resources :users

end
