class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :text
      t.integer :seller_id
      t.integer :buyer_id
      t.integer :item_id

      t.timestamps
    end
  end
end
