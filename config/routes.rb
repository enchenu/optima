Rails.application.routes.draw do
  namespace :panel do
  	resources :users, except: [:show]
    get 'users/index'
    get 'dashboard/index'
  end

  devise_for :users, :skip => [:registration]
  
  root 'panel/dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
