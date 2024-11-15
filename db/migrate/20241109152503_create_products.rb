class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :brand
      t.string :product_type
      t.string :engine_type
      t.string :color
      t.float :cost

      t.timestamps
    end
  end
end
