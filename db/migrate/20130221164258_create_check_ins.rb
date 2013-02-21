class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.text :review
      t.integer :rating
      t.boolean :wishlist
      t.integer :beer_id
      t.integer :user_id

      t.timestamps
    end
  end
end
