class Subject < ActiveRecord::Base
  enum subject_type: {流動資産:0, 支出:1, 収入:2}  

  has_many :subjects, class_name: "Subject",foreign_key: "parent_subject_id"
  has_many :credit_entries, class_name: "EntryItem",foreign_key: "credit_subject_id"
  has_many :debit_entries, class_name: "EntryItem",foreign_key: "debit_subject_id"
  belongs_to :parent_subject, :class_name => 'Subject'                        
  validates :name, presence:true
  
  def ledger_amount
    credit_sum = self.credit_entries.sum(:credit_amount)
    debit_sum =  self.debit_entries.sum(:debit_amount)
    
    if self.subject_type == '流動資産' || self.subject_type == '支出'
        return credit_sum -debit_sum
    elsif self.subject_type == '収入'
        return debit_sum - credit_sum
    else
        raise 'wrong subject type %s' % self.subject_type
    end
  end
end
