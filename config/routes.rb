# frozen_string_literal: true

Rails.application.routes.draw do
  resources :promotions
  resources :product_promotions, controller: :promotions
  resources :basket_promotions, controller: :promotions
  resources :products do
    post :add_to_cart
    collection do
      get :checkout
      delete :clear_cart
    end
  end

  root '/', controller: :products, action: :index
end
