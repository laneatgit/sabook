class Subject < ActiveRecord::Base
  SUBJECT_TYPES = ["支出", "収入"]
  validates :name, :description, :subject_type, presence: true
end
