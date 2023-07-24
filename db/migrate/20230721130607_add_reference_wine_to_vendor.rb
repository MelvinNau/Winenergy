class AddReferenceWineToVendor < ActiveRecord::Migration[7.0]
  def change
    add_reference :vendors, :wine, foreign_key: true
  end
end
