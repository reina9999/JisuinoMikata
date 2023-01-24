Rails.application.routes.draw do

  #会員用URL
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  #管理者用URL
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root :to  => "homes#top"
    get "homes/about" => "homes#about"
    get "cook/search" => "searches#search"

    # ネスト
    resources :cooks, only:[:index,:show,:edit,:new,:create,:update,:destroy] do
      resources :bookmarks, only:[:create,:destroy]
      resources :cook_comments, only:[:create,:destroy]
    end

    resources :menus, only:[:index,:create,:show,:destroy]
    resources :searches, only:[:search]
    resources :customers, only:[:show,:edit,:update] do
      collection do
        get :confirm
        patch :withdraw
      end
      member do
        get :bookmarks
      end
    end
  end

  namespace :admin do
    root :to => "homes#top"
    resources :cooks,only:[:show,:update,:destroy] do
      resources :cook_comments, only:[:destroy]
    end
    resources :customers, only:[:index,:show,:edit,:update]
    resources :genres, only:[:index,:create,:edit,:update]
    resources :tags,only:[:index,:edit,:create,:update,:destroy]
  end

  devise_scope :customer do
    post 'customers/guest_sign_in',to: 'public/sessions#guest_sign_in'
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htmlend