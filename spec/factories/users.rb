FactoryBot.define do

  factory :user do
    name                  {"testname"}
    email                 {"hoge@hoge.hoge"}
    password              {"12345678"}
    password_confirmation {"12345678"}
  end

end