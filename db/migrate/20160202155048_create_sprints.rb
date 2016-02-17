class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.belongs_to :team, index: true

      t.string :name
      t.integer :points
      t.boolean :open
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps null: false
    end
  end
end
