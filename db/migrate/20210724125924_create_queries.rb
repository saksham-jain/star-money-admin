class CreateQueries < ActiveRecord::Migration[6.1]
  def change
    create_table :queries do |t|
      t.string :reason
      t.string :full_name
      t.string :email
      t.string :phone
      t.timestamps
    end
  end
end
