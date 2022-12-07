class Item < ApplicationRecord
  validates :name, :content, presence: true

  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :sender_id
    validates :delivery_day_id
  end

  belongs_to :user
  has_one_attched :image
end
