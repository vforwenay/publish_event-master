FactoryBot.define do
  factory :location do
  	name { Faker::Address.community  }
  	lat { Faker::Address.latitude }
  	lng { Faker::Address.longitude  }
  	country { Faker::Address.country }
  	state { Faker::Address.state }
  	city { Faker::Address.city }
  	zipcode { Faker::Address.zip_code  }
  	address_line_1 { Faker::Address.full_address }
  	address_line_2 { Faker::Address.full_address }
  	association :creator, factory: :user

    after(:create) do |location, evaluator|
      location.images.attach(io: File.open('spec/support/assets/location.jpg'), filename: 'location.jpg')
    end
  end 
end