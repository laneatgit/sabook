class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.text :description
      t.references :parent_subject, index: true, foreign_key: true
      t.integer :level
      t.integer :subject_type

      t.timestamps null: false
    end
  end
end
