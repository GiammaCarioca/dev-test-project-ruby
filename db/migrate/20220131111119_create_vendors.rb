# frozen_string_literal: true

class CreateVendors < ActiveRecord::Migration[6.1]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
