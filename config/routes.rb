# frozen_string_literal: true

Rails.application.routes.draw do
  root 'application#welcome'

  resources :categories

  resources :styles do
    resources :likes
    collection do
      get :american
      get :german
      get :british
      get :belgian
      get :historical
      get :uncategorised
    end
  end

  resource :session, only: %i[new create destroy]

  get 'signup', to: 'users#new'

  resources :users
end
