class AddFieldsToClients < ActiveRecord::Migration[6.1]
  def change
    add_column :clients, :reliance_client_id, :string
    add_column :clients, :demat_number, :string
    add_column :clients, :reliance_bank_name, :string
    add_column :clients, :reliance_bank_account_number, :string
    add_column :clients, :ipo, :boolean
    add_column :clients, :user_id, :string
  end
end
