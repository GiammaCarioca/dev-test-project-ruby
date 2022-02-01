# frozen_string_literal: true

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'valid if description is a string' do
    description = Product.new(description: "R$10 off R$20 of food")
    description.valid?
    assert_empty description.errors[:description]
  end

  test 'valid if base_price is integer' do
    base_price = Product.new(base_price: 5)
    base_price.valid?
    assert_empty base_price.errors[:base_price]
  end

  test 'valid if base_price is greater than 0' do
    base_price = Product.new(base_price: 3)
    base_price.valid?
    assert_empty base_price.errors[:base_price]
  end

  test 'valid if base_price is 0' do
    base_price = Product.new(base_price: 0)
    base_price.valid?
    assert_empty base_price.errors[:base_price]
  end

  test 'invalid if base_price is string' do
    base_price = Product.new(base_price: "5.0")
    base_price.valid?
    assert_not base_price.errors[:base_price].empty?
  end

  test 'invalid if base_price is float' do
    base_price = Product.new(base_price: 5.0)
    base_price.valid?
    assert_not base_price.errors[:base_price].empty?
  end

  test 'invalid if base_price less than 0' do
    base_price = Product.new(base_price: -3.0)
    base_price.valid?
    assert_not base_price.errors[:base_price].empty?
  end
end
