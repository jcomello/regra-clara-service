# Cria factory para para Comment
FactoryGirl.define do
  factory :comment do
    sequence(:text) { |n| "Comentario #{n}" }
    from "Livanio"
  end
end
