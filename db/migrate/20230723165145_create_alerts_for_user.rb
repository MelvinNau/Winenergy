class CreateAlertsForUser < ActiveRecord::Migration[7.0]
  def change
    create_table :alerts do |t|
      t.integer :wine_id
      t.integer :user_id
      t.string :variety
      t.string :designation
      t.string :domain
      t.timestamps
    end
  end
end
