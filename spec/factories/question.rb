# Cria factory para para Question
FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "Titulo #{n}" }
    from "Livanio"
  end
end
