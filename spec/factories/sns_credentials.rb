FactoryBot.define do
  factory :sns_credential do
    provider              {'twitter'}
    uid                   { Faker::Number.number(19) }
    user
  end
end
