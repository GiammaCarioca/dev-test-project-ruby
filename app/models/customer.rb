# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :purchases
  has_many :products, through: :purchases

  validates :name, presence: true, uniqueness: true

  def self.assign_from_row(row)
    Customer.where(name: row[:purchaser_name]).first_or_initialize
  end
  
end
