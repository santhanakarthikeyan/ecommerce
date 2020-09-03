# frozen_string_literal: true

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test '#has_promotion?' do
    assert Product.where(name: 'Apple').first.has_promotion?
    assert_not Product.where(name: 'Computer').first.has_promotion?
  end
end
