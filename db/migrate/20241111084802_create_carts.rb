class CreateCarts < ActiveRecord::Migration[7.2]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true, index: true
      t.timestamps
    end
  end
end
