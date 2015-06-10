class Reply
  include Mongoid::Document

  field :text,  type: String
  field :from,  type: String
  field :likes, type: Integer, default: 0

  embedded_in :question
end
