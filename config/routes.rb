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
  
  resources :users , only: [:new , :create] do
    get "showPicture", on: :collection
    patch "updatePicture"
    patch "updatePronpt"

    get "selectPictureStyle", on: :collection
    patch "updatePictureStyle"
  end

  resource :session , only: [:create , :destroy]
  resource :account , only: [:show , :edit , :update]

  namespace :admin do
    root "top#index"
    resources :users , only: [:index , :edit , :update] do
      patch "updatePicture"
      patch "updatePronpt"
    end
  end
end