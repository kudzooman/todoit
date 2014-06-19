Rails.application.routes.draw do

 resources :todos, only: [:index]

 resources :lists do
    resources :todos, only: [:create, :destroy]
  end

  devise_for :users

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  
end
