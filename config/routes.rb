Rails.application.routes.draw do
  resources :promotions
  resources :products do
    post :add_to_cart
    collection do
      get :checkout
      delete :clear_cart
    end
  end

  root '/', controller: :products, action: :index
end
