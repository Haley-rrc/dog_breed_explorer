Rails.application.routes.draw do
  root "breeds#index"

  resources :breeds, only: [:index, :show]

  get "about", to: "pages#about", as: :about
end