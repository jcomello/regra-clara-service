json.id @procedure.id.to_s

json.name @procedure.name

json.description @procedure.description

json.comments @procedure.comments

json.rules @procedure.rules do |rule|
  json.id rule.id.to_s
  json.description rule.description

  json.questions rule.questions do |question|
    json.id question.id.to_s
    json.title question.title
    json.from question.from

    json.replies question.replies do |reply|
      json.id reply.id.to_s
      json.text reply.text
      json.from reply.from
    end
  end
end
