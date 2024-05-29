class CreatePromotions < ActiveRecord::Migration[7.1]
  def change
    create_table :promotions do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :inn_room, null: false, foreign_key: true
      t.integer :discount

      t.timestamps
    end
  end
end
