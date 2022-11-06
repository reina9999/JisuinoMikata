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

  devise_for :genres
  devise_for :cooks

scope module: :public do
  root :to  => "homes#top"
  get "homes/about" => "homes#about"
  get "customers/confirm" => "customers#confirm"
  #get "searches" => "public#searches"

  resources :cooks, only:[:index,:show,:edit,:new,:create,:update,:destroy]
  resources :cook_comments, only:[:create,:destroy]
  resources :bookmarks, only:[:create,:destroy]
  resources :searches, only:[:search]
  resource :customers, only:[:show,:edit,:update]
end
namespace :admin do
  root :to => "homes#top"#訂正要？

  #get :"customers/invalid" => "customers#invalid"

  resources :customers, only:[:index]

end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htmlend