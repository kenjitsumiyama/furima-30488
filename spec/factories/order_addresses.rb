FactoryBot.define do
  factory :order_address do
    token         {"tok_abcdefghijk00000000000000000"}
    postal_code   {"222-3333"}
    prefecture_id {2}
    city          {"市町村"}
    address       {11}
    building      {"ビル"}
    phone_number  {22233334444}

  end
end
