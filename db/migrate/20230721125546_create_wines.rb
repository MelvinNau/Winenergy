class CreateWines < ActiveRecord::Migration[7.0]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :domain
      t.integer :label
      t.string :variety
      t.string :designation
      t.integer :alcohol
      t.integer :years
      t.string :url_img

      t.timestamps
    end
  end
end
