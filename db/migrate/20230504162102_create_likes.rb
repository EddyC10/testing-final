class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :fan_id
      t.integer :shoe_id

      t.timestamps
    end
  end
end
