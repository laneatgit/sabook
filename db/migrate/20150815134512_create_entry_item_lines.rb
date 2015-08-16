class CreateEntryItemLines < ActiveRecord::Migration
  def change
    create_table :entry_item_lines do |t|
      t.belongs_to :entry_item, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true
      t.integer :direction
      t.integer :amount

      t.timestamps null: false
    end
  end
end
