class Comment
  include Mongoid::Document

  field :text, type: String
  field :from, type: String

  embedded_in :procedure
end
