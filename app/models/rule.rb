class Rule
  include Mongoid::Document

  field :description, type: String

  embeds_many :questions
  embedded_in :procedure
end
