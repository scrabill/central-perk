class MenuItem < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items

  validates :name, presence: true
  validates :name, uniqueness: true

  def self.items_count
    MenuItem.all.count
  end
end
