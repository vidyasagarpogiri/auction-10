class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.string :amount
      t.integer :buyer_id
      t.integer :item_id

      t.timestamps
    end
  end
end
