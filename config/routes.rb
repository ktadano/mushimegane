Rails.application.routes.draw do
  root 'home#index'
  post 'import' => 'home#create'

end
