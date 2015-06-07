# Cria factory para para Question
FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "Titulo #{n}" }
    from "Livanio"

    factory :question_with_replies do
      replies { create_list :reply, 2}
    end
  end
end
