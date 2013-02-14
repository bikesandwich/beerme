class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :title
      t.string :brewery
      t.integer :rating
      t.text :note
      t.boolean :wishlist

      t.timestamps
    end
  end
end
