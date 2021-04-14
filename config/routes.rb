Rails.application.routes.draw do
  root 'events#index'

  resources :users, only: [:show, :edit, :update], shallow: true do
    resources :events
  end
end
