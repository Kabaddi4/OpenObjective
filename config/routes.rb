Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'

  resources :users, only:[:index, :show] do
    member do
      get :follows, :followers
    end
    resources :relationships, only: [:create, :destroy]
  end

  resources :targets, only:[:index, :show, :new, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end

  get 'targets/result' => 'targets#result'
end
