Rails.application.routes.draw do
  namespace :panel do
    get 'dashboard/index'
  end

  devise_for :users
  
  root 'panel/dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
