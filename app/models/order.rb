class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :menu_items, through: :order_items

  validates :name_for_pickup, presence: true

  # TODO: Custom messaging for menu_item_ids validation errors
  validates :menu_item_ids, presence: true

  scope :completed, -> { where(completed: true) }

  def time_taken
    created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def total
    total = 0
    self.menu_items.each do |item|
      total += item.price
    end
    total
  end

  def status
    if self.completed == false
      "In Progress"
    else
      "Completed"
    end
  end
end
