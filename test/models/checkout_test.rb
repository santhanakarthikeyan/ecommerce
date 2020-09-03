# frozen_string_literal: true

require 'test_helper'

class CheckoutTest < ActiveSupport::TestCase
  setup do
    @apple = Product.find_by(name: 'Apple').id
    @ball = Product.find_by(name: 'Ball').id
    @computer = Product.find_by(name: 'Computer').id
    @datadog = Product.find_by(name: 'DataDog').id
  end

  test '#total' do
    checkout = Checkout.new([@apple, @ball, @computer])
    checkout.compute
    assert_equal checkout.total, 100.0
    assert_equal checkout.discount, 0.0
  end

  test 'Multiples of two and three' do
    checkout = Checkout.new([@ball, @apple, @ball, @apple, @apple])
    checkout.compute
    assert_equal checkout.total, 110.0
    assert_equal checkout.discount, 20.0
  end

  test 'Basket promotion' do
    checkout = Checkout.new([@ball, @apple, @ball, @apple, @apple, @computer, @datadog])
    checkout.compute
    assert_equal checkout.total, 155.0
    assert_equal checkout.discount, 40.0
  end

  test 'product promotions with others' do
    checkout = Checkout.new([@computer, @apple, @datadog, @apple, @apple])
    checkout.compute
    assert_equal checkout.total, 140.0
    assert_equal checkout.discount, 15.0
  end
end
