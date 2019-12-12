class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :menu_items, through: :order_items

  validates :name_for_pickup, presence: true

  # TODO: Custom messaging for menu_item_ids validation errors
  validates :menu_item_ids, presence: true

  scope :completed, -> { where(completed: true) }
end
