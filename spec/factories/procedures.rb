# Cria factorygirl para procedure
FactoryGirl.define do
  factory :procedure do
    sequence(:name) { |n| "Processo #{n}" }
    description "MyString"

    factory :procedure_full do
      rules { build_list :rule_with_questions, 2 }
      comments { build_list :comment, 2 }
    end
  end
end
