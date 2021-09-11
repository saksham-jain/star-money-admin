class CreateAnalytics < ActiveRecord::Migration[6.1]
  def change
    create_table :analytics do |t|
      t.integer :unique_visits, default: 0
      t.integer :total_visits, default: 0
    end
  end
end
