Rails.application.routes.draw do
  resources :users, only: %i[new create]
  root "articles#index", as: "home"
  get 'signup'  => 'users#new', as: "signup"
  resources :articles do
    resources :comments
  end
end
