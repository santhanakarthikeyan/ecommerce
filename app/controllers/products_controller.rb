# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy add_to_cart]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /products/1/add_to_cart
  # POST /products/1/add_to_cart.json
  def add_to_cart
    session[:item_list] ? session[:item_list] << @product.id : session[:item_list] = [@product.id]
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product added to cart!' }
      format.json { head :no_content }
    end
  end

  # DELETE /products/clear_cart
  def clear_cart
    session[:item_list] = []
    redirect_to products_url, notice: 'Cart is empty!'
  end

  # GET /products/checkout
  def checkout
    if session[:item_list].empty?
      redirect_to products_url, notice: 'Cart is empty!, Add items to cart'
    else
      checkout = Checkout.new(session[:item_list])
      checkout.compute
      respond_to do |format|
        format.html { redirect_to products_url, notice: "Total: #{checkout.total}\nDiscount: #{checkout.discount}" }
        format.json { render json: { total: checkout.total } }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :price, :promotion_id)
  end
end
