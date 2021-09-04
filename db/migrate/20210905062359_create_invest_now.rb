class CreateInvestNow < ActiveRecord::Migration[6.1]
  def change
    create_table :invest_nows do |t|
      t.string :email
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end
end
