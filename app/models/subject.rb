class Subject < ActiveRecord::Base

  enum subject_type: {asset:0, equity:1, expense:2, income:3, liability:4, imblance:5}  
  has_closure_tree
  
  #has_many :subjects, class_name: "Subject",foreign_key: "parent_subject_id"
  #belongs_to :parent_subject, :class_name => 'Subject'
  
  validates :name, presence:true

  def all_leaves(list)
    if self.subjects.count == 0
      list.push(self)
    else
        self.subjects.each do |iter|
            if iter.subjects.count == 0
              list.push iter
            else
              all_leaves(list)
            end
        end
    end
  end
  
  def ledger_amount
    list = []
    leaf_children = all_leaves(list)
    
    credit_sum = 0
    debit_sum = 0
    
    list.each do |iter|
      credit_sum += EntryItemLine.where(["direction = 0 and subject_id = :id", { id: iter.id }]).sum(:amount)
      debit_sum +=  EntryItemLine.where(["direction = 1 and subject_id = :id", { id: iter.id }]).sum(:amount)
    end
    
    if self.subject_type == '流動資産' || self.subject_type == '支出'
        return credit_sum -debit_sum
    elsif self.subject_type == '収入' || self.subject_type == '開始残高'
        return debit_sum - credit_sum
    else
        raise 'wrong subject type %s' % self.subject_type
    end
  end
end
