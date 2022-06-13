class AddPositionToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :position, :integer
    Order.open.order(:updated_at).each.with_index(1) do |order, index|
      order.update_column :position, index
    end
    Order.prepare_for_delivery.order(:updated_at).each.with_index(1) do |order, index|
      order.update_column :position, index
    end
    Order.delivered.order(:updated_at).each.with_index(1) do |order, index|
      order.update_column :position, index
    end
  end
end
