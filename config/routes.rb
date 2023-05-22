Rails.application.routes.draw do
  
  namespace :api do
    get 'should_retain', to: 'should_retain#index'
  end

  resources :plans

  # root "articles#index"
end
