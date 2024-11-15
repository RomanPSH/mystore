class AddCascadeDeleteToOrderItems < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :order_items, :orders
    remove_foreign_key :order_items, :products

    add_foreign_key :order_items, :orders, on_delete: :cascade
    add_foreign_key :order_items, :products, on_delete: :cascade
  end
end
