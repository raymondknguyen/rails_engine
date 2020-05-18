FactoryBot.define do
  factory :transaction do
    credit_card_number { "MyString" }
    credit_card_expiration_date { "2020-05-18" }
    result { "MyString" }
  end
end
