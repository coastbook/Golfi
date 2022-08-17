Rails.application.routes.draw do


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
    resources :users, only:[:index,:show,:edit,:update]
    resources :columns, only:[:index,:new,:create,:show,:edit,:update]
  end

  namespace :admin do
    root to: 'homes#top'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end