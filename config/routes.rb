Rails.application.routes.draw do
  root "application#welcome"

  get "styles" => "styles#index"
  get "styles/:id" => "styles#show", as: "style"
end
