class CreateShoes < ActiveRecord::Migration[6.0]
  def change
    create_table :shoes do |t|
      t.string :image
      t.string :title
      t.text :description
      t.string :shoe_type
      t.integer :size
      t.boolean :authentic
      t.boolean :deadstock
      t.integer :owner_id

      t.timestamps
    end
  end
end
