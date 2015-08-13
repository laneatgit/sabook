class EntryItem < ActiveRecord::Base
  belongs_to :credit_subject, :class_name => 'Subject'
  belongs_to :debit_subject, :class_name => 'Subject'
  validate :credit_and_debit_amount_must_be_equal
  validates :entry_date, :credit_subject, :debit_subject, presence:true
  
  # non-db field
  attr_accessor :subject_id

  def credit_and_debit_amount_must_be_equal
    errors.add(:credit_amount, 'credit and debit amount must be equal') if credit_amount != debit_amount
  end
end
