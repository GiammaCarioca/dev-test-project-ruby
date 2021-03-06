# frozen_string_literal: true

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  def setup
    @customer = Customer.create(name: 'João Silva')
  end

  test 'valid if name is a string' do
    name = customers(:one)[:name]
    assert assert_instance_of(String, name)
  end

  test 'name should be unique' do
    duplicate_customer = @customer.dup
    @customer.save(validate: false)
    duplicate_customer.valid?
    assert duplicate_customer.errors
    assert duplicate_customer.errors[:name]
  end
end
