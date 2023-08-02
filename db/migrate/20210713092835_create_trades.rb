class CreateTrades < ActiveRecord::Migration[6.1]
  def change
    create_table :trades do |t|
      t.string :exchange
      t.string :actionee
      t.string :client_id
      t.string :client_name
      t.integer :order_type
      t.integer :transaction_type
      t.string :scrip
      t.float :price
      t.integer :quantity
      t.string :time
      t.string :date
      t.string :platform
      t.timestamps
    end
  end
end
