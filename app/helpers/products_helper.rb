# frozen_string_literal: true

module ProductsHelper
  def options_for_promotion
    ProductPromotion.all.map do |pp|
      [pp.name, pp.id]
    end
  end
end
