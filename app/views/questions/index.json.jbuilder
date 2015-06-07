json.array! @questions do |question|
  json.id question.id.to_s
  json.title question.title
  json.from question.from
  json.repliesCount question.replies_count
end
