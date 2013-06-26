class Buyer < ActiveRecord::Base
  attr_accessible :name

  has_many :items, :through => :bids 
  has_many :bids 
  has_many :messages
end
