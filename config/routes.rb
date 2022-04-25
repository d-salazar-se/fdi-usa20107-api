Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :users, only: [:index, :show, :create, :update]
  end

  resources :auth, except: [:index, :create, :show, :update, :destroy] do
    collection do
      post :login
      get :logout
    end
  end

  get '/auth/google_oauth2/callback', to: 'sessions#google_auth'
  get '/auth/failure', to: redirect('/')
end
