# frozen_string_literal: true

require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test 'should get index' do
    get products_url
    assert_response :success
  end

  test 'should get new' do
    get new_product_url
    assert_response :success
  end

  test 'should create product' do
    assert_difference('Product.count') do
      post products_url, params: { product: { name: @product.name, price: @product.price } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test 'should show product' do
    get product_url(@product)
    assert_response :success
  end

  test 'should get edit' do
    get edit_product_url(@product)
    assert_response :success
  end

  test 'should update product' do
    patch product_url(@product), params: { product: { name: @product.name, price: @product.price } }
    assert_redirected_to product_url(@product)
  end

  test 'should destroy product' do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end

  test 'should add to cart' do
    post product_add_to_cart_url(@product, id: @product.id)
    assert_equal session[:item_list].size, 1
    assert_equal session[:item_list].first, @product.id
    assert_redirected_to products_url
  end

  test 'should clear cart' do
    delete clear_cart_products_path
    assert_equal session[:item_list].size, 0
    assert_redirected_to products_url
  end

  test 'should checkout' do
    post product_add_to_cart_url(@product, id: products(:one))
    post product_add_to_cart_url(@product, id: products(:two))
    post product_add_to_cart_url(@product, id: products(:three))
    get checkout_products_url(format: :json)
    assert_response :success
    json = JSON.parse(response.body)
    assert_equal json['total'], 100.0
  end
end
