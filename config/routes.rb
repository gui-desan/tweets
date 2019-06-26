Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'

  get 'tweets', to: 'tweets#index', as: :tweets_index
  post 'tweets', to: 'tweets#create', as: :tweets_create
  get 'tweets/:id', to: 'tweets#show', as: :tweets_show
  delete 'tweets/:id', to: 'tweets#destroy', as: :tweets_destroy

  post 'tweets/:tweet_id/like', to: 'likes#create', as: :likes_create
  delete 'tweets/:tweet_id/like', to: 'likes#destroy', as: :likes_destroy

  get 'tweets/:tweet_id/reply/new', to: 'replies#new', as: :replies_new
  post 'tweets/:tweet_id/reply', to: 'replies#create', as: :replies_create

  get 'tweets/:tweet_id/retweet/new', to: 'retweets#new', as: :retweets_new
  post 'tweets/:tweet_id/retweet', to: 'retweets#create', as: :retweets_create

  get 'hash_tags/:name', to: 'hash_tags#show', as: :hash_tags_show

  get 'profile/edit', to: 'profiles#edit', as: :profiles_edit
  get 'profile', to: 'profiles#show', as: :profiles_show
  patch 'profile', to: 'profiles#update', as: :profiles_update

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
end
