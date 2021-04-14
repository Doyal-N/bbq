Rails.application.routes.draw do
  root "welcome#index"
  devise_for :users

  resources :users, only: [:show, :edit, :update], shallow: true do
    resources :events
  end
end
