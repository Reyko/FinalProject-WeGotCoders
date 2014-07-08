class Order < ActiveRecord::Base
  validates :address,:city,:postcode, :presence => true
  belongs_to :buyer
  belongs_to :seller
end
