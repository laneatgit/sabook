class CreateEntryItems < ActiveRecord::Migration
  def change
    create_table :entry_items do |t|
      t.date :entry_date
      t.text :explanation
      t.references :credit_subject, index: true, foreign_key: true
      t.references :debit_subject, index: true, foreign_key: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end
