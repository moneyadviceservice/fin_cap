FactoryBot.define do
  factory :translation do
    locale "MyString"
    key "MyString"
    value "MyString"
    interpolations "MyText"
    is_proc false
  end
end
