Rails.application.routes.draw do
  root 'home#index'
  post 'import' => 'home#create'
  delete 'delete' => 'home#destroy'
  post 'compare' => 'compare#create'
  get 'result' => 'comparison_result#show'
end
