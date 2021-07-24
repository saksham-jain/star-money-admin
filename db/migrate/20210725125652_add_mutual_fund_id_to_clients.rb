class AddMutualFundIdToClients < ActiveRecord::Migration[6.1]
  def change
    add_column :clients, :starmf_client_code, :string
    add_column :clients, :nj_client_code, :string
  end
end
