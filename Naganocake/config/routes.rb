Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in...
  
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  root to: 'public/homes#top'
  get 'about', to: 'public/homes#about'
  
  devise_scope :customer do
   get '/customers/sign_out' => 'public/sessions#destroy'
  end

  get 'public/customers/my_page', to: 'public/customers#show'
  get 'public/customers/information/edit', to: 'public/customers#edit'
  patch 'public/customers/my_page', to: 'public/customers#update'
  
  get 'public/customers/unsubscribe_check', to: 'public/customers#unsubscribe_check'
  patch 'public/customers/unbsubscribe', to: 'public/customers#unsubscribe'
  
  post 'public/orders/complete', to: 'public/orders#complete'
  
  namespace :public do
    resources :items, only: [:index, :show]
    resources :orders, only: [:index, :show, :new] do
      
      collection do
        post '/confirm' => 'orders#confirm'
      end
    end
    resources :addresses, except: [:new, :show]
    resources :cart_items, only: [:index, :destroy, :update, :create] do
      collection do
        delete '/destroy_all' => 'cart_items#destroy_all'
      end      
    end
  end

# 管理者用
# URL /admin/sign_in ...

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  get 'admin', to: 'admin/home#top'

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:new, :index, :show, :edit, :create, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :orders, only: [:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
end