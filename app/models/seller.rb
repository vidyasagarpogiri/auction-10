class Seller < ActiveRecord::Base
  attr_accessible :name

  has_many :items
  has_many :messages


end
