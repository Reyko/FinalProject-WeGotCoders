class Listing < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :location
  belongs_to :seller


  # Validations for a listing to be created
  validates :title, :location_id, :address, :postcode, :price, :avatar, :presence => true
  validates :price, numericality: { greater_than: 0 }  
end
