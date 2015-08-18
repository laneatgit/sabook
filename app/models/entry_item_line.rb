class EntryItemLine < ActiveRecord::Base
  belongs_to :entry_item
  belongs_to :subject
  enum direction: {借:0, 貸:1}  
  
  validates :subject, presence:true
  validates :amount, numericality: { greater_than: 0 }
    
end
