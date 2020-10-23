FactoryBot.define do

  factory :address do
    postalcode        {"1234567"}
    prefecture        {"12"}
    city              {"大阪市北区"}
    house_number      {"扇町1-2-3"}
    building_number   {"スカイビル123号室"}
    dial_number       {"09012345678"}
  end

end