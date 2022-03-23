class CreateVisitorsByCountry < ActiveRecord::Migration[6.1]
  def change
    create_table :visitors_by_countries do |t|
      t.string :country_iso
      t.integer :visitors

      t.timestamps
    end
  end
end
