# Cria factorygirl para procedure
FactoryGirl.define do
  factory :procedure do
    sequence(:name) { |n| "Processo #{n}" }
    description "MyString"
  end
end
