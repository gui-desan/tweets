Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tweets, except: [:new, :show, :edit, :update, :destroy] do
    resources :likes, module: :tweets, only: [:create, :destroy]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  root 'tweets#index'
end
