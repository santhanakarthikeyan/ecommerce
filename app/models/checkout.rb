# frozen_string_literal: true

class Checkout
  def initialize(item_list)
    @item_list = item_list
    @total = 0
    @discount = 0
  end

  def compute
    product_list = group_by_product_count
    product_list.each do |id, qty|
      product = Product.find(id)
      @total += qty * product.price
      apply_product_promotion(product, qty) if product.has_promotion?
    end
    apply_basket_promotion if has_basket_promo?
  end

  attr_reader :total

  attr_reader :discount

  private

  def apply_product_promotion(product, qty)
    promotion_qty = product.promotion.qty
    return unless promotion_qty >= qty

    multiplier = qty / promotion_qty
    @total -= product.promotion.discount_price * multiplier
    @discount += product.promotion.discount_price * multiplier
  end

  def apply_basket_promotion
    basket_promo = BasketPromotion.find_by('basket_price <= ?', @total)
    return unless basket_promo

    @total -= basket_promo.discount_price
    @discount += basket_promo.discount_price
  end

  def has_basket_promo?
    BasketPromotion.any?
  end

  def group_by_product_count
    {}.tap do |hsh|
      @item_list.each do |item|
        hsh[item] ? hsh[item] += 1 : hsh[item] = 1
      end
    end
  end
end
