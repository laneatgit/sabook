class Subject < ActiveRecord::Base

  enum subject_type: {asset:0, equity:1, expense:2, income:3, liability:4}  
  has_closure_tree dependent: :destroy
  
  has_many :credit_entry_items, class_name: "EntryItem",foreign_key: "credit_subject_id", dependent: :destroy
  has_many :debit_entry_items, class_name: "EntryItem",foreign_key: "debit_subject_id", dependent: :destroy
  validates :name, :subject_type, presence:true
  validate :validate_parent
  before_save :update_sort_order

  
  def header_at_credit
    case subject_type
      when 'asset'
          '入金'
      when 'expense'
          '費用'
      when 'equity'
          '減少'
      when 'income'
          '費用'
      when 'liability'
          '減少'
      else
          raise 'can not recoginze this subject type'
      end  
  end
  def header_at_debit
    case subject_type
      when 'asset'
          '出金'
      when 'expense'
          '割引'
      when 'equity'
          '増加'
      when 'income'
          '収入'
      when 'liability'
          '増加'
      else
          raise 'can not recoginze this subject type'
      end  
  end

  def display_path
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
      credit_sum += EntryItem.where(["credit_subject_id = :id", { id: iter.id }]).sum(:amount)
      debit_sum +=  EntryItem.where(["debit_subject_id = :id", { id: iter.id }]).sum(:amount)
    end
    
    if self.subject_type == 'asset' || self.subject_type == 'expense'
        return credit_sum -debit_sum
    else
        return debit_sum - credit_sum
    end
  end

  def validate_parent
    if !fixed and parent == nil
      errors.add(:parent_id, "must specify a parent")
    end
    if parent!=nil and (parent.credit_entry_items.count > 0 or parent.debit_entry_items.count > 0)
      errors.add(:parent_id, "can not be a child of subject has been used.")
    end

  end
  
  def update_sort_order
    
    if self.parent != nil
    
      # find siblin with max sort roder and plus 1
      max_sort_order =  self.parent.sort_order
      
      self.siblings.each do |t|
        max_sort_order = t.sort_order if t.sort_order > max_sort_order
      end
      
      
     
      
      
    end
  end

end
