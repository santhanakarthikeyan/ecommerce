class AddPromotionIdInProduct < ActiveRecord::Migration[5.2]
  def change
    #add_column :products, :promotion_id, :integer
    add_reference :products, :promotion, foreign_key: true
  end
end
