class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.references :locatable, polymorphic: true, index: true
      t.column :lat, :decimal, precision: 15, scale: 10
      t.column :lng, :decimal, precision: 15, scale: 10

      t.timestamps
    end
  end
end
