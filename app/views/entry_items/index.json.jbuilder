json.array!(@entry_items) do |entry_item|
  json.extract! entry_item, :id, :entry_date, :explanation, :credit_subject_id, :credit_amount, :debit_subject_id, :debit_amount
  json.url entry_item_url(entry_item, format: :json)
end
