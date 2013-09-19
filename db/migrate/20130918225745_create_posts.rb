class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :text_field, null: false
      t.string :post_type, default: "standard"

      t.timestamps
    end

    add_index :posts, :id
    add_index :posts, :user_id
    add_index :posts, :post_type
  end
end
