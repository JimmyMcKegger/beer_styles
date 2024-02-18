# frozen_string_literal: true

Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
  root 'application#welcome'
  get 'about', to: 'application#about'

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

  resources :users do
    post 'generate_token'
  end
  post '/users/:id/create_api_key', to: 'users#create_api_key', as: 'create_user_api_key'
  delete '/users/:id/destroy_token/:token', to: 'users#destroy_api_token', as: 'destroy_user_token'
end
