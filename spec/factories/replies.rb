# Cria factory para para Reply
FactoryGirl.define do
  factory :reply do
    sequence(:text) { |n| "Texto #{n}" }
    from "Livanio"
  end
end
