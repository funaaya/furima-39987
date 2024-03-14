FactoryBot.define do
  factory :item do
    association :user

    name                  { '商品名' }    # 'item_name'から'name'に変更
    description           { '商品の説明' }
    category_id           { 2 }
    item_status_id        { 2 }
    shipping_cost_id      { 2 }
    prefecture_id         { 2 }
    shipping_date_id      { 2 }
    price                 { 50000 }


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end



