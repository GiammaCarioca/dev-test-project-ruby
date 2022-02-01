# frozen_string_literal: true

require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  test 'valid if quantity is integer' do
    quantity = Purchase.new(quantity: 3)
    quantity.valid?
    assert_empty quantity.errors[:quantity]
  end

  test 'valid if quantity is 0' do
    quantity = Purchase.new(quantity: 0)
    quantity.valid?
    assert_empty quantity.errors[:quantity]
  end

  test 'invalid if quantity is float' do
    quantity = Purchase.new(quantity: 3.0)
    quantity.valid?
    assert_not quantity.errors[:quantity].empty?
  end

  test 'invalid if quantity is less than 0' do
    quantity = Purchase.new(quantity: -3)
    quantity.valid?
    assert_not quantity.errors[:quantity].empty?
  end
end
