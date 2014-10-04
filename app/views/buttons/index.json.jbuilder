json.array!(@buttons) do |button|
  json.extract! button, :id
  json.extract! button, :name
end
