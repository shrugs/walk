class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :trip, foreign_key: true
      t.column :text, :string

      t.timestamps
    end
  end
end
