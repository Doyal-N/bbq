FactoryBot.define do
  factory :event do
    title { 'Создание' }
    description { 'text' }
    address { 'Сызрань' }
    datetime { Time.now + 1.day }
    pincode { nil }

    user
  end
end
