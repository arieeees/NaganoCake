Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end

  namespace :admin do
    get 'customers/index'
  end

  namespace :admin do
    get 'customers/show'
  end

  namespace :admin do
    get 'customers/edit'
  end

  namespace :admin do
    get 'genres/index'
  end

  namespace :admin do
    get 'genres/edit'
  end

  namespace :admin do
    get 'items/index'
  end

  namespace :admin do
    get 'items/new'
  end

  namespace :admin do
    get 'items/show'
  end

  namespace :admin do
    get 'items/edit'
  end

  namespace :admin do
    get 'homes/top'
  end

  namespace :public do
    get 'addresses/index'
  end

  namespace :public do
    get 'addresses/edit'
  end

  namespace :public do
    get 'orders/new'
  end

  namespace :public do
    get 'orders/complete'
  end

  namespace :public do
    get 'orders/index'
  end

  namespace :public do
    get 'orders/show'
  end

  namespace :public do
    get 'cart_items/index'
  end

  namespace :public do
    get 'customers/show'
  end

  namespace :public do
    get 'customers/edit'
  end

  namespace :public do
    get 'customers/unsubscribe'
  end

  namespace :public do
    get 'items/index'
  end

  namespace :public do
    get 'items/show'
  end

  namespace :public do
    get 'homes/top'
  end

  namespace :public do
    get 'homes/about'
  end

  # 顧客用
  # URL /customers/sign_in...
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
