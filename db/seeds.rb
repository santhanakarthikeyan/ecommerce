# frozen_string_literal: true

Promotion.create!([
                    { id: 2, name: 'MultiplesOfThree', qty: 3, basket_price: nil, discount_price: 15.0, type: 'ProductPromotion' },
                    { id: 3, name: 'MultiplesOfTwo', qty: 2, basket_price: nil, discount_price: 5.0, type: 'ProductPromotion' },
                    { id: 1, name: 'BasketPromotion', qty: nil, basket_price: 150.0, discount_price: 20.0, type: 'BasketPromotion' }
                  ])
Product.create!([
                  { name: 'A', price: 30.0, promotion_id: 2 },
                  { name: 'B', price: 20.0, promotion_id: 3 },
                  { name: 'C', price: 50.0, promotion_id: nil },
                  { name: 'D', price: 15.0, promotion_id: nil }
                ])
# Promotion.create!([
# {name: "BasketPromotion", qty: nil, basket_price: 150.0, discount_price: 20.0, type: "BasketPromotion"}
# ])
# Promotion.create!([
# {name: "MultiplesOfThree", qty: 3, basket_price: nil, discount_price: 15.0, type: "ProductPromotion"},
# {name: "MultiplesOfTwo", qty: 2, basket_price: nil, discount_price: 5.0, type: "ProductPromotion"}
# ])
