Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'products#index'

  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products

  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
end
