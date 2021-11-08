Rails.application.routes.draw do
  root "articles#index", as: "home"

  resources :articles
end
