json.array! @procedures do |procedure|
  json.id procedure.id.to_s
  json.name procedure.name
  json.description procedure.description
end
