Rails.application.routes.draw do
  root to: 'saved_weathers#index'
  devise_for :users

  resources :saved_weathers, except: [:new, :edit, :show, :update]
end
