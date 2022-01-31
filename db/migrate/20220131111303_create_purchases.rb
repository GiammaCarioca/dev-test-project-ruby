# frozen_string_literal: true

class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.integer :quantity
      t.belongs_to :customer, null: false, foreign_key: true
      t.belongs_to :vendor, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
