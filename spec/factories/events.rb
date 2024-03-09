FactoryBot.define do
  factory :event do
    name { Faker::Address.community  }
    start_at { (Time.now + 72.hours) }
    end_at { (Time.now + 76.hours)  }
    location
    association :creator, factory: :user
    
    after(:create) do |event, evaluator|
      event.images.attach(io: File.open('spec/support/assets/event.jpg'), filename: 'event.jpg')
    end
  end
end