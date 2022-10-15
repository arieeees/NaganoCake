Rails.application.routes.draw do
  get 'homes/about'

  get 'orders/show'

  get 'customers/index'

  get 'customers/show'

  get 'customers/edit'

  get 'genres/index'

  get 'genres/edit'

  get 'items/index'

  get 'items/show'

  get 'items/edit'

  get 'homes/top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
