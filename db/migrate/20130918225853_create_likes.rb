class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :post_id
      t.integer :liker_id, null: false
      t.integer :comment_id
      t.boolean :value

      t.timestamps
    end

    add_index :likes, :id
    add_index :likes, :value
    add_index :likes, :post_id
  end
end
