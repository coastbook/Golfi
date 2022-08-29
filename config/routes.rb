Rails.application.routes.draw do

  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
    # 顧客用
  # URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  root to: 'public/homes#top'
  get 'public/homes/about' => 'public/homes#about', as: 'about'

  namespace :public do
    resources :users, only:[:index,:show,:edit,:update,:destroy] do
      member do
        get :favorites
        patch :release
        patch :nonrelease
        
      end
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :columns, only:[:index,:new,:create,:show,:edit,:update,:destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
  end

  namespace :admin do
    root to: 'homes#top'
    resources :users, only:[:index,:show,:edit,:update,:destroy]
    resources :columns, only:[:index,:new,:create,:show,:edit,:update,:destroy] do
      resources :post_comments, only: [:destroy]
    end
  end

  get "search" => "searches#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end