Rails.application.routes.draw do
  root "articles#index", as: "home"

  resources :articles do
    resources :comments
  end
end
