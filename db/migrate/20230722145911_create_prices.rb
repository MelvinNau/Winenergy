class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.references :wine, null: false, foreign_key: true
      t.date :date
      t.integer :price

      t.timestamps
    end
  end
end
