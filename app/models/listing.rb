class Listing < ActiveRecord::Base
  belongs_to :location
  belongs_to :seller


  # Validations for a listing to be created
  validates :title, :location_id, :address, :postcode, :price, :presence => true
  validates :price, numericality: { greater_than: 0 }  
end
