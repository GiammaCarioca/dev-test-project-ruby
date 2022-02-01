# frozen_string_literal: true

require 'test_helper'
require 'helpers/money_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'price_to_dollars returns a float value' do
    price_in_cents = 50000
    result = price_to_dollars(price_in_cents)
    assert assert_instance_of(Float, result)
  end

  test 'gross_income returns a float value' do
    purchases = Purchase.all
    result = gross_income(purchases)
    assert assert_instance_of(Float, result)
  end
end

class MoneyHelperTest < ActiveSupport::TestCase
  test 'price_to_base returns an integer value' do
    price_in_dollars = 50.000
    result = MoneyHelper.price_to_base(price_in_dollars)
    assert assert_instance_of(Integer, result)
  end
end
