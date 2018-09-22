class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :user, foreign_key: true
      t.column :name, :string, null: false
      t.column :handle, :string, index: true, unique: true, null: false
      t.column :status, :integer, null: false, default: 0

      t.timestamps
    end
  end
end
