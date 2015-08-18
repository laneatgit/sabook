class Subject < ActiveRecord::Base
  enum subject_type: {流動資産:0, 支出:1, 収入:2, 開始残高:3}  

  has_many :subjects, class_name: "Subject",foreign_key: "parent_subject_id"
  belongs_to :parent_subject, :class_name => 'Subject'                        
  validates :name, presence:true
  
  def ledger_amount
    credit_sum = EntryItemLine.where(["direction = 0 and subject_id = :id", { id: self.id }]).sum(:amount)
    debit_sum =  EntryItemLine.where(["direction = 1 and subject_id = :id", { id: self.id }]).sum(:amount)
    
    if self.subject_type == '流動資産' || self.subject_type == '支出'
        return credit_sum -debit_sum
    elsif self.subject_type == '収入' || self.subject_type == '開始残高'
        return debit_sum - credit_sum
    else
        raise 'wrong subject type %s' % self.subject_type
    end
  end
end
