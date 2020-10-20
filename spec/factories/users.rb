FactoryBot.define do
  factory :user do
    nickname              {"山田マン"}
    email                 {"kkkk@gmail.com"}
    password              {"kkkk12345"}
    password_confirmation {password}
    # encrypted_password{"kkk12345"}
    last_name       {"山田"}
    first_name        {"太郎"}
    last_name_kana  {"ヤマダ"}
    first_name_kana   {"タロウ"}
    birth_date         {"1990-08-24"}
  end
end
