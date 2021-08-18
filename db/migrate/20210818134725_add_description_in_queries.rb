class AddDescriptionInQueries < ActiveRecord::Migration[6.1]
  def change
    add_column :queries, :description, :text
  end
end
