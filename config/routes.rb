Rails.application.routes.draw do
  get 'accounts/show'
  get 'accounts/edit'
  # get 'top/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  
  root 'top#index'
  get "bad_request" => "top#bad_request"
  get "forbidden" => "top#forbidden"
  get "internal_server_error" => "top#internal_server_error"
  
  resources :users do
    get "showPicture", on: :collection
    patch "updatePicture"
  end

  resource :session , only: [:create , :destroy]
  resource :accounts , only: [:show , :edit , :update]
end