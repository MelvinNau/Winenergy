class AddReferenceVendorToWine < ActiveRecord::Migration[7.0]
  def change
    add_reference :wines, :vendor, foreign_key: true
  end
end
