FactoryBot.define do
  factory :item do
    
    name                   {Faker::String.random}
    description            {Faker::Lorem.characters(number: 1000)}
    brand                  {Faker::String.random}
    state                  {Faker::Number.between(from: 1, to: 6)}
    fee                    {Faker::Number.between(from: 1, to: 2)}
    term                   {Faker::Number.between(from: 1, to: 3)}
    price                  {Faker::Number.within(range: 300..9999999)}
    category               {Category.all.sample}
    prefecture             {Prefecture.all.sample}
    association :seller, factory: :user
    association :buyer, factory: :user

    trait :with_nested_instances do
      after(:create) do |item|
        create :image, id: item.id
      end
    end
  end
end