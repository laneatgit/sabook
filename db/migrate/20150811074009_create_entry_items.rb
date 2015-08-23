class CreateEntryItems < ActiveRecord::Migration
  def change
    create_table :entry_items do |t|
      t.date :entry_date
      t.text :explanation
      t.integer :credit_subject_id, null: false
      t.integer :debit_subject_id, null: false
      t.integer :amount
      t.timestamps null: false
    end
  end
end
