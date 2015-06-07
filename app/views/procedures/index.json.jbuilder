json.array! @procedures do |procedure|
  json.id procedure.id
  json.name procedure.name
  json.description procedure.description
end
