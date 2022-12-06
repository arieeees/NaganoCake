Rails.application.routes.draw do
  
  # 顧客用
  # URL /customers/sign_in...
  root to: 'public/homes#top'
  get 'about', to: 'public/homes#about'
  
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_scope :customer do
   get '/customers/sign_out' => 'public/sessions#destroy'
  end
  
  namespace :public do
    resources :items, only: [:index, :show]
    resources :orders, only: [:index, :show]
    resources :addresses, except: [:new, :show]
    resources :cart_items, only: [:index]
    get 'customers/my_page', to: '/customer#show'
    get 'customers/information/edit', to: '/customer#edit'
    get 'customers/unsubscribe', to: '/customer#unsubscribe'
    
  end

  # 管理者用
  # URL /admin/sign_in...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, except: [:destroy]
    resources :genres, except: [:new, :show, :destroy]
    resources :orders, only: [:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end