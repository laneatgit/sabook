class Subject < ActiveRecord::Base

  enum subject_type: {asset:0, equity:1, expense:2, income:3, liability:4}  
  has_closure_tree
  
  #has_many :subjects, class_name: "Subject",foreign_key: "parent_subject_id"
  #belongs_to :parent_subject, :class_name => 'Subject'
  
  validates :name, presence:true

  def diplay_path()
    list = []
    self.self_and_ancestors.reverse.each do |i|
      list.push i.name
    end
    return list.join(' > ')    
  end
  
  def ledger_amount
    credit_sum = 0
    debit_sum = 0
    
    self.leaves.each do |iter|
      credit_sum += EntryItemLine.where(["direction = 0 and subject_id = :id", { id: iter.id }]).sum(:amount)
      debit_sum +=  EntryItemLine.where(["direction = 1 and subject_id = :id", { id: iter.id }]).sum(:amount)
    end
    
    if self.subject_type == 'asset' || self.subject_type == 'expense'
        return credit_sum -debit_sum
    else
        return debit_sum - credit_sum
    end
  end
end
