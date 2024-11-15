class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total_amount
      t.string :address
      t.string :phone
      t.string :delivery_method
      t.string :payment_method

      t.timestamps
    end
  end
end
