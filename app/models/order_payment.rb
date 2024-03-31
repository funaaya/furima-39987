class OrderPayment 
  include ActiveModel::Model
  attr_accessor :item_id, :postcode, :prefecture_id, :block, :city, :building, :phone_number, :user_id, :product_id, :token, :price

  with_options presence: true do
    validates :block
    validates :user_id
    validates :token
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :item_id
  end

    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

    def save
      order = Order.create(user_id: user_id, item_id: item_id)

      Payment.create(order_id: order.id, postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number)
    end
end