class AddCreatedByClientToClients < ActiveRecord::Migration[6.1]
  def change
    add_column :clients, :activated, :boolean, default: false
  end
end
