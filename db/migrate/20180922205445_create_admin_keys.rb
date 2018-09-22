class CreateAdminKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_keys do |t|
      t.column :key, :string
      t.timestamps
    end
  end
end
