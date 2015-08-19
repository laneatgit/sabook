class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.text :description
      t.integer :subject_type
      t.integer :parent_id, null: true
      t.boolean :frozen, :default => false
      t.timestamps null: false
    end
  end
end
