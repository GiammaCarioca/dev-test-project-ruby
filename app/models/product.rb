# frozen_string_literal: true

require 'helpers/money_helper'

class Product < ApplicationRecord
  belongs_to :vendor
  has_many :purchases

  validates :description, presence: true
  validates :base_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.upload(file)
    counter = 0

    CSV.foreach(file.path, col_sep: "\t", headers: true, header_converters: :symbol, encoding: 'UTF-8') do |row|
      product = Product.assign_from_row(row)

      if product.save
        counter += 1
      else
        puts product.errors.full_messages.join(',').to_s
      end

      puts "Imported #{counter} products."
    end
  end

  def self.assign_from_row(row)
    vendor = Vendor.where('name' => row[:merchant_name])

    product = Product.where(description: row[:item_description], 'vendor_id' => vendor[0].id).all.first_or_initialize

    product.assign_attributes base_price: MoneyHelper.price_to_base(row[:item_price])

    product
  end
end
