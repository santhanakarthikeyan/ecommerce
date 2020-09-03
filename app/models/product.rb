# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :promotion, optional: true

  def has_promotion?
    promotion.present?
  end
end
