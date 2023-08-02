class AddRequestForInInvestNow < ActiveRecord::Migration[6.1]
  def change
    add_column :invest_nows, :request_for, :string
  end
end
