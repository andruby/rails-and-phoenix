json.array!(@talks) do |talk|
  json.extract! talk, :id, :title, :presenter
  json.url talk_url(talk, format: :json)
end
