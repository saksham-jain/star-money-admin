class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :pan
      t.string :email
      t.string :phone_number
      t.string :reliance_client_code
      t.string :city
      t.timestamps  
    end
  end
end
