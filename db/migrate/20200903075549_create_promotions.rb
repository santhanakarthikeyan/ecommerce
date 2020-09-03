# frozen_string_literal: true

class CreatePromotions < ActiveRecord::Migration[5.2]
  def change
    create_table :promotions do |t|
      t.string :name
      t.integer :qty
      t.float :basket_price
      t.float :discount_price
      t.string :type

      t.timestamps
    end
  end
end
