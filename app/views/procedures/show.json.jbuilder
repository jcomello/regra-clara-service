json.name @procedure.name

json.description @procedure.description

json.comments @procedure.comments

json.rules @procedure.rules do |rule|
  json.description rule.description

  json.questions rule.questions do |question|
    json.title question.title
    json.from question.from

    json.replies question.replies do |reply|
      json.text reply.text
      json.from reply.from
    end
  end
end
