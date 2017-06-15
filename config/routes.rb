Rails.application.routes.draw do

  get '/' => 'sessions#welcome', as: 'welcome'
  get '/signin' => 'sessions#new', as: 'signin'
  post '/signin' => 'sessions#create'

  resources :users, only: [:show, :new, :create, :edit]

end
