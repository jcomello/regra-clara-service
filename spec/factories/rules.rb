# Cria factory para para Rule
FactoryGirl.define do
  factory :rule do
    sequence(:description) { |n| "Regra #{n}" }

    factory :rule_with_questions do
      questions { build_list :question_with_replies, 2 }
    end
  end
end
