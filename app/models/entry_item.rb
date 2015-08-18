class EntryItem < ActiveRecord::Base
  has_many :entry_item_lines, dependent: :destroy
  accepts_nested_attributes_for :entry_item_lines

  #validate :credit_and_debit_amount_must_be_equal
  validates :entry_date, :explanation, presence:true



 # def credit_and_debit_amount_must_be_equal
 #   errors.add(:credit_amount, 'credit and debit amount must be equal') if credit_amount != debit_amount
 # end
end
