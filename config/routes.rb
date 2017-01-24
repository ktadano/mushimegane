Rails.application.routes.draw do
  root 'home#index'
  post 'import' => 'home#create'
  post 'compare' => 'compare#create'
  get 'result' => 'comparison_result#show'
end
