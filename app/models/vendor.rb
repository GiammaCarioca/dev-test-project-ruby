# frozen_string_literal: true

class Vendor < ApplicationRecord
  has_many :products
  has_many :purchases, through: :customers
  has_many :customers, through: :purchases

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true

  def self.assign_from_row(row)
    vendor = Vendor.where(name: row[:merchant_name]).first_or_initialize

    vendor.assign_attributes address: row[:merchant_address]

    vendor
  end
end
