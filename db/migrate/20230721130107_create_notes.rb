class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :wine, null: false, foreign_key: true
      t.integer :score
      t.text :comment
      t.integer :balance
      t.integer :intensity
      t.integer :complexity
      t.integer :aroma

      t.timestamps
    end
  end
end
