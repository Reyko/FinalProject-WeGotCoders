class Seller < User
  has_many :listings, dependent: :destroy
end
