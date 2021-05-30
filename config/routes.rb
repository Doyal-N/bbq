Rails.application.routes.draw do
  root "events#index"
  devise_for :users, path_names: { sign_in: :login, sign_out: :logout  },
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :events, shallow: true do
    resources :comments, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]
    resources :images, only: [:create, :destroy]

    post :show, on: :member
  end

  resources :users, only: [:show, :edit, :update]
end
