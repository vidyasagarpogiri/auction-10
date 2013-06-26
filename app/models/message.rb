class Message < ActiveRecord::Base
  attr_accessible :buyer_id, :item_id, :seller_id, :text

  belongs_to :item
  belongs_to :buyer
  belongs_to :seller
end
