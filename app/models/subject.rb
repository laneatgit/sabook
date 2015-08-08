class Subject < ActiveRecord::Base
  belongs_to :parent_subject, :class_name => 'Subject'
end
