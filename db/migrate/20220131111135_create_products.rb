# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :description
      t.integer :base_price
      t.belongs_to :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
