class Seller < User
  has_many :listings, dependent: :destroy
  has_many :orders
end
