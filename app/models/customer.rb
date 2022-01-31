# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :purchases
  has_many :products, through: :purchases

  validates :name, presence: true, uniqueness: true

  def self.upload(file)
    counter = 0

    CSV.foreach(file.path, col_sep: "\t", headers: true, header_converters: :symbol, encoding: 'UTF-8') do |row|
      customer = Customer.assign_from_row(row)

      if customer.save
        counter += 1
      else
        puts customer.errors.full_messages.join(',').to_s
      end

      puts "Imported #{counter} customers."
    end
  end

  def self.assign_from_row(row)
    Customer.where(name: row[:purchaser_name]).first_or_initialize
  end
end
