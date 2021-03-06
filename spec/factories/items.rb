FactoryBot.define do
  factory :item do
    name                    {'洋服'}
    info                    {'お譲りします'}
    category_id             {2}
    sales_status_id         {2}
    shipping_fee_status_id  {2}
    prefecture_id           {2}
    scheduled_delivery_id   {2}
    price                   {2000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test-image.png'), filename: 'test_image.png')
    end
  end
end
