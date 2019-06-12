Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tweets, only: [:index, :create] do
    resources :likes, module: :tweets, only: [:create, :destroy]
    resources :replies, module: :tweets, only: [:new, :create]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  root 'tweets#index'
end
