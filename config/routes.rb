# frozen_string_literal: true

Rails.application.routes.draw do
  root 'application#welcome'

  resources :styles do
    collection do
      get :american
      get :german
      get :british
      get :belgian
    end
  end

  resources :users
  get 'signup', to: 'users#new'
end
