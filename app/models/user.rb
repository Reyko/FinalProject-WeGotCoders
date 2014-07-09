class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :type


  # User account details
  attr_accessor :account_number
  attr_accessor :account_routing
  attr_accessor :account_country
  attr_accessor :stripe_token


  before_create do

    Stripe.api_key = ENV['STRIPE_API_KEY']

    # Get the bank account details submitted by the form
    token_id = self.stripe_token

    # Create a Recipient
    recipient = Stripe::Recipient.create(
      :name => "#{self.first_name} #{self.last_name}",
      :type => "individual",
      :email => self.email,
      :bank_account => token_id
    )

    self.recipient_id = recipient.id

  end

end
