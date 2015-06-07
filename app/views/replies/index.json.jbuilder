json.array! @replies do |reply|
  json.id reply.id.to_s
  json.text reply.text
  json.from reply.from
end
