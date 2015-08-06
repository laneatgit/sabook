class CreateSubjectCategories < ActiveRecord::Migration
  def change
    create_table :subject_categories do |t|
      t.string :name
      t.text :description
      t.string :subject_category_type

      t.timestamps null: false
    end
  end
end
