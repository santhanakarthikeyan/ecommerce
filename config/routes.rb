Rails.application.routes.draw do
  resources :products do
    post :add_to_cart
  end

  delete :clear_cart, controller: 'products'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
