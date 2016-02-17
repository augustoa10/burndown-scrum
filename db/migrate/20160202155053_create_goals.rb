class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.belongs_to :sprint, index: true

      t.integer :points
      t.integer :burned_points
      t.datetime :burned_at
      t.timestamps null: false
    end
  end
end
