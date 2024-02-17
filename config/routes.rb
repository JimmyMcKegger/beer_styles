Rails.application.routes.draw do
  root "application#welcome"

  resources :styles do
    collection do
      get :american
      get :german
      get :british
      get :belgian
    end
end
end
