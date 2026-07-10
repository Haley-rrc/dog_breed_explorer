Rails.application.routes.draw do
  root "breeds#index"

  resources :breeds, only: [ :index, :show ]
  resources :sub_breeds, only: [ :show ]
  resources :dog_images, only: [ :show ]

  get "about", to: "pages#about", as: :about
end
