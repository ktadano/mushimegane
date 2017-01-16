Rails.application.routes.draw do
  root 'home#index'

  resources 'home', only: :index do
    collection { post :import }
  end
end
