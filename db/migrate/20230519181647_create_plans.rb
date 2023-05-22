class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.text :description
      t.integer :daily_retention
      t.integer :monthly_retention
      t.integer :annual_retention

      t.timestamps
    end
  end
end
