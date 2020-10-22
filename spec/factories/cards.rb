FactoryBot.define do
  factory :card do
    # id {1}
    # user_id {1}
    customer_id { "cus_xxxxxxxxxxxxxx" }
    card_id { "car_yyyyyyyyyyyyyyy" }
    user = FactoryBot.create(:user)
    # association :user
  end
end