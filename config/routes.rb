Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :users, only: [:index, :show, :create, :update]
  end

  resources :auth, except: [:index, :create, :show, :update, :destroy] do
    collection do
      post :login
      post :refresh
      get :logout
    end
  end

  resources :disabilities, only: [:index, :show, :create, :update, :destroy]
end
