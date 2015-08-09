class Subject < ActiveRecord::Base
  enum subject_type: {流動資産:0, 支出:1, 収入:2}  

  has_many :subjects, class_name: "Subject",
                          foreign_key: "parent_subject_id"
  belongs_to :parent_subject, :class_name => 'Subject'                        
  validates :name, presence:true
end
