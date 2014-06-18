Rails.application.routes.draw do

 resources :lists, only: [:new, :index, :update]

  devise_for :users

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  
end
