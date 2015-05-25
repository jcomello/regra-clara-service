# Cria factory para para Rule
FactoryGirl.define do
  factory :rule do
    sequence(:description) { |n| "Regra #{n}" }
  end
end
