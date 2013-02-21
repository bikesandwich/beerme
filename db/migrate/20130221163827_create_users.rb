class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.integer :user_type
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
