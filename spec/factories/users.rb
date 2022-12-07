FactoryBot.define do
  factory :user do
    nickname                  { Faker::Name.last_name }
    email                     { Faker::Internet.free_email }
    password                  { Faker::Internet.password(min_length: 6) }
    password_confirmation     { password }
    last_name                 { '富おカ' }
    first_name                { '義ゆウ' }
    last_name_kana            { 'トミオカ' }
    first_name_kana           { 'ギユウ' }
    birthday                  { Faker::Date.between(from: '1930-01-1', to: '2017-12-31') }
  end
end
