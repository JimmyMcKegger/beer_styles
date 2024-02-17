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

  resource :session, only: %i[new create destroy]

  resources :users
  get 'signup', to: 'users#new'
end
