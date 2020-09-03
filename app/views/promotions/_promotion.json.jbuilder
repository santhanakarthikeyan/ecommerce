json.extract! promotion, :id, :name, :qty, :basket_price, :discount_price, :type, :created_at, :updated_at
json.url promotion_url(promotion, format: :json)
