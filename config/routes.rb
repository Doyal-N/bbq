# frozen_string_literal: true

Rails.application.routes.draw do
  root 'events#index'
  devise_for :users, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :events, shallow: true do
    resources :comments, only: %i[create destroy]
    resources :subscriptions, only: %i[create destroy]
    resources :images, only: %i[create destroy]
  end

  resources :users, only: %i[show edit update]
end
