FactoryBot.define do
  factory :item do
    
    name                   {Faker::String.random}
    description            {Faker::Lorem.sentence}
    brand                  {Faker::String.random}
    state                  {Faker::Number.between(from: 1, to: 6)}
    fee                    {Faker::Number.between(from: 1, to: 2)}
    term                   {Faker::Number.between(from: 1, to: 3)}
    price                  {Faker::Number.within(range: 300..9999999)}
    prefecture             {Prefecture.all.sample}
    association :seller
    category

    trait :with_ten_images do
      after(:build) do |item|
        10.times do
          item.images << FactoryBot.build(:image, item: item)
        end
      end
    end
    
    trait :with_eleven_images do
      after(:build) do |item|
        11.times do
          item.images << FactoryBot.build(:image, item: item)
        end
      end
    end

  end

end