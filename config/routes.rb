Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: "groups#index", as: :authenticated_root
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "splash#index"

  resources :groups, only: [:index, :new, :create] do
    resources :entities, only: [:index, :new, :create]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
