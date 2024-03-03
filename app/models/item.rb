class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # テーブルとのアソシエーション
  belongs_to :user
  # has_one :buy
  # has_many :comments

  belongs_to :category
  belongs_to :delivery_area
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipping_date

  has_one_attached :image

  with_options presence: true do
    validates :user_id
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :delivery_area_id
    validates :shipping_date_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :delivery_area_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :shipping_date_id
    validates :category_id, numericality: { other_than: 0, message: 'Select' }
  end
end
