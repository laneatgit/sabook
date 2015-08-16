json.array!(@entry_item_lines) do |entry_item_line|
  json.extract! entry_item_line, :id, :entry_item_id, :subject_id, :direction, :amount
  json.url entry_item_line_url(entry_item_line, format: :json)
end
