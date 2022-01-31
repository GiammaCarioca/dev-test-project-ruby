# frozen_string_literal: true

class Vendor < ApplicationRecord
  has_many :products
  has_many :purchases, through: :customers
  has_many :customers, through: :purchases

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true

  def self.upload(file)
    counter = 0

    CSV.foreach(file.path, col_sep: "\t", headers: true, header_converters: :symbol, encoding: 'UTF-8') do |row|
      vendor = Vendor.assign_from_row(row)

      if vendor.save
        counter += 1
      else
        puts vendor.errors.full_messages.join(',').to_s
      end

      puts "Imported #{counter} vendors."
    end
  end

  def self.assign_from_row(row)
    vendor = Vendor.where(name: row[:merchant_name]).first_or_initialize

    vendor.assign_attributes address: row[:merchant_address]

    vendor
  end
end
