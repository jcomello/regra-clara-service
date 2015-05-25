class Question
  include Mongoid::Document

  field :title, type: String
  field :from, type: String
end
