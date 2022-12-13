FactoryBot.define do
  factory :purchase_order do
    post_code                 { '123-4567' }
    sender_id                 { Faker::Number.between(from: 2, to: 48) }
    town                      { 'テスト市' }
    house_number              { 'テスト１−１ー１１' }
    building_number           { 'テストビル１階' }
    phone_number              { '09012345678' }
    token                     { 'tok000o0o0000o0' }
  end
end
