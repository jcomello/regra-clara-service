class Reply
  include Mongoid::Document

  field :text, type: String
  field :from, type: String

end
