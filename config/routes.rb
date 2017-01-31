Rails.application.routes.draw do
  root 'home#index'
  post 'import' => 'home#create'
  delete 'delete' => 'contents#destroy'
  post 'compare' => 'comparison_result#create'
  get 'result' => 'comparison_result#index'
end
