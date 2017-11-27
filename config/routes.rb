# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'saved_weathers#index'
  devise_for :users

  resources :saved_weathers, except: %i[new edit show update]
end
