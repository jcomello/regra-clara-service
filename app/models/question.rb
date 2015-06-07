class Question
  include Mongoid::Document

  field :title, type: String
  field :from, type: String

  embeds_many :replies

  def replies_count
    replies.count
  end
end
