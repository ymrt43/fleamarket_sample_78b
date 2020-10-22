FactoryBot.define do
  factory :card do
    customer_id { "cus_xxxxxxxxxxxxxx" }
    card_id { "car_yyyyyyyyyyyyyyy" }
    # user = FactoryBot.create(:user)
  end
end