class AddPostcodeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :postcode, :string
  end
end
