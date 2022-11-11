class CreateBulkDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :bulk_discounts do |t|
      t.float :percent_discount
      t.integer :quantity_threshold

      t.timestamps
    end
  end
end
