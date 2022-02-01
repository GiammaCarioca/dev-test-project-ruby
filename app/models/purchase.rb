# frozen_string_literal: true

require 'helpers/money_helper'

class Purchase < ApplicationRecord
  belongs_to :customer
  belongs_to :vendor
  belongs_to :product

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.assign_from_row(row)
    product = Product.where('description' => row[:item_description])
    customer = Customer.where('name' => row[:purchaser_name])
    vendor = Vendor.where('name' => row[:merchant_name])

    purchase = Purchase.where(
      'product_id' => product[0].id,
      'customer_id' => customer[0].id,
      'vendor_id' => vendor[0].id
    )
                       .all.first_or_initialize

    purchase.assign_attributes quantity: (row[:purchase_count]).to_i

    purchase
  end
end
