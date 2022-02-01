# frozen_string_literal: true

require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  def setup
    @vendor = Vendor.create(name: "Tom's Awesome Shop")
  end

  test 'valid if name is a string' do
    name = vendors(:one)[:name]
    assert assert_instance_of(String, name)
  end

  test 'valid if address is a string' do
    address = vendors(:one)[:address]
    assert assert_instance_of(String, address)
  end

  test 'valid if address is not nil' do
    address = Vendor.new(address: "987 Fake St")
    address.valid?
    assert address != nil
  end

  test 'invalid if address is nil' do
    address = vendors(:no_address).address
    assert assert_nil(address)
  end

  test "name should be unique" do
    duplicate_vendor = @vendor.dup
    @vendor.save(validate: false)
    duplicate_vendor.valid?
    assert duplicate_vendor.errors
    assert duplicate_vendor.errors[:name]
  end
end
