class Item < ActiveRecord::Base
  attr_accessible :name, :seller_id

  belongs_to :seller
  has_many :messages
  has_many :bids
  has_many :buyers, :through => :bids
end
