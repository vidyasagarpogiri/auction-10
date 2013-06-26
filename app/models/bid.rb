class Bid < ActiveRecord::Base
  attr_accessible :amount, :buyer_id, :item_id

  belongs_to :buyer
  belongs_to :item
end
