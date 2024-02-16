Rails.application.routes.draw do
  root "application#welcome"

  get "styles" => "styles#index"
  get "styles/:id" => "styles#show", as: "style"
  get "styles/:id/edit" => "styles#edit", as: "edit_style"
  patch "styles/:id" => "styles#update"
end
