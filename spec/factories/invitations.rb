FactoryBot.define do
  factory :invitation do
  	event
    association :sender, factory: :user
    association :receiver, factory: :user
  end
end