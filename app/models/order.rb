class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :menu_items, through: :order_items

  scope :completed, -> { where(completed: true) }
end
