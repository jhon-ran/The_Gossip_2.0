Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  resources :users
  resources :gossips
  resources :cities

  resources :gossips do
    resources :comments
  end
  
end
