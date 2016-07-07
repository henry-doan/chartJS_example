class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.string :name
      t.string :industry
      t.date :last_service
      t.boolean :evil
      t.integer :durability
      t.string :color
      t.belongs_to :inventor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
