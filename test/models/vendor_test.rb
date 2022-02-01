# frozen_string_literal: true

require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  def setup
    @vendor = Vendor.create(name: "Tom's Awesome Shop")
  end

  test 'valid if name is a string' do
    name = Vendor.new(name: "Bob's Pizza")
    name.valid?
    assert_empty name.errors[:name]
  end

  test 'valid if address is a string' do
    address = Vendor.new(address: "987 Fake St")
    address.valid?
    assert_empty address.errors[:address]
  end

  test 'valid if address is not nil' do
    address = Vendor.new(address: "987 Fake St")
    address.valid?
    assert address != nil
  end

  test 'invalid if address is nil' do
    address = Vendor.new(address: "987 Fake St")
    address.valid?
    assert_not address == nil
  end

  test "name should be unique" do
    duplicate_vendor = @vendor.dup
    @vendor.save(validate: false)
    duplicate_vendor.valid?
    assert duplicate_vendor.errors
    assert duplicate_vendor.errors[:name]
  end
end
