class PurchaseOrder
  include ActiveModel::Model
  attr_accessor :post_code, :sender_id, :town, :house_number, :building_number, :phone_number, :purchase_id, :item_id, :user_id, :token
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :town
    validates :house_number
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/}
    validates :item_id
    validates :user_id
    validates :token
  end

  validates :sender_id, numericality: { other_than: 1, message: "can't be blank" }


  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Order.create(post_code: post_code, sender_id: sender_id, town: town, house_number: house_number, building_number: building_number, phone_number: phone_number, purchase_id: purchase.id)
  end
end
