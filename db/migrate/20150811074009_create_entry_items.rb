class CreateEntryItems < ActiveRecord::Migration
  def change
    create_table :entry_items do |t|
      t.date :entry_date
      t.text :explanation
      t.timestamps null: false
    end
  end
end
