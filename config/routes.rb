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
  get "customers/confirm" => "customers#confirm"
  patch "customers/withdraw" => "customers#withdraw"
  #get "searches" => "public#searches"

  resources :cooks, only:[:index,:show,:edit,:new,:create,:update,:destroy] do

    resources :bookmarks, only:[:create,:destroy]
    resources :cook_comments, only:[:create,:destroy]
    resources :menus, only:[:new,:create]
  end


  resources :searches, only:[:search]
  resources :customers, only:[:show,:edit,:update] do
     member do
       get :bookmarks
     end
   end
end
namespace :admin do
  root :to => "homes#top"#訂正要？

  #get :"customers/invalid" => "customers#invalid"

  resources :customers, only:[:index]
  resources :genres, only:[:index,:create,:edit,:update]

end

devise_scope :customer do
  post 'customers/guest_sign_in',to: 'public/sessions#guest_sign_in'

end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htmlend