class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.float :total_amount_in_euro
      t.datetime :shipped_at

      t.timestamps
    end
  end
end
