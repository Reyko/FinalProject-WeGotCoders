class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.integer :location_id
      t.string :address
      t.string :postcode

      t.timestamps
    end
  end
end
