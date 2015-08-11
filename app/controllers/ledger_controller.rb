class LedgerController < ApplicationController
  def index
    subject_id = params[:subject_id]
    @subject = Subject.find(subject_id)
    @entry_items = EntryItem.where(credit_subject:subject_id)
    @entry_items = EntryItem.where(["credit_subject_id = :id or debit_subject_id = :id", { id: subject_id }]).order(:entry_date)
  end
end
