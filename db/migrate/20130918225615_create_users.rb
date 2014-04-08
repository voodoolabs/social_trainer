class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.text   :about
      t.string :password_digest, null: false
      t.string :password_confirmation
      t.string :email, null: false
      t.boolean :status, default: false
      t.integer :friend_id
      t.string :photo_url
      t.datetime :banned_until

      t.timestamps
    end
    
    add_index :users, :email, unique: true
    add_index :users, :id
  end
end
