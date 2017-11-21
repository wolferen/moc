Rails.application.routes.draw do
  root to: 'saved_weathers#index'

  resources :saved_weathers
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
