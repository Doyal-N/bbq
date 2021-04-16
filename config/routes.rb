Rails.application.routes.draw do
  root "events#index"
  devise_for :users, path_names: { sign_in: :login, sign_out: :logout  }

  resources :events
  resources :users, only: [:show, :edit, :update]
end
