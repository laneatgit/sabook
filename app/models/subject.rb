class Subject < ActiveRecord::Base
  enum subject_type: {流動資産:0, 支出:1, 収入:2}  
  belongs_to :parent_subject, :class_name => 'Subject'
end
