class EntryItem < ActiveRecord::Base
  
  belongs_to :credit_subject, class_name: 'Subject',foreign_key: 'credit_subject_id'
  belongs_to :debit_subject, class_name: 'Subject',foreign_key: 'debit_subject_id'


  validates :entry_date, :explanation, presence:true
  validates :credit_subject,:debit_subject, presence:true
  validates :amount, numericality: { greater_than: 0 }
  validate :credit_must_not_be_equal_to_debit

  def credit_amount_for(subject)
    credit_subject == subject ? amount : 0
  end

  def debit_amount_for(subject)
    credit_subject == subject ? 0 : amount
  end

  def credit_must_not_be_equal_to_debit
    if (credit_subject == debit_subject)
        errors.add(:credit_subject, "can't be the same as debit")
        errors.add(:debit_subject, "can't be the same as credit")
    end
  end

end
