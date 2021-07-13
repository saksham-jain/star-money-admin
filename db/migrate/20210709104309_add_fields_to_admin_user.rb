class AddFieldsToAdminUser < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :first_name, :string
    add_column :admin_users, :last_name, :string
    add_column :admin_users, :phone_number, :string
    add_reference :admin_users, :role
  end
end
