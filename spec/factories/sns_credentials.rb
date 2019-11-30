FactoryBot.define do
  factory :sns_credential do
    provider              { 'twitter' }
    uid                   { '123456' }
    user
  end
end
