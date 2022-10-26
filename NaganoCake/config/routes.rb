Rails.application.routes.draw do
  
  # 顧客用
  # URL /customers/sign_in...
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :public do
    root 'homes#top'
    resources :items, only: [:index, :show]
    resources :customer, only: [:show, :edit, :update]
    resources :orders, only: [:index, :show]
    resources :addresses, except: [:new, :show]
  end

  # 管理者用
  # URL /admin/sign_in...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    root 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, except: [:destroy]
    resources :genres, except: [:new, :show, :destroy]
    resources :orders, only: [:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end