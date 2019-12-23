class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :menu_items, through: :order_items

  validates :name_for_pickup, presence: true

  # TODO: Custom messaging for menu_item_ids validation errors
  validates :menu_item_ids, presence: true

  scope :completed, -> { where(completed: true) }

  def self.completed_count
    Order.where(completed: true).count
  end

  def self.orders_count
    Order.all.count
  end

  def self.most_popular

    # TODO: Update to Ruby 2.7 + and use .tally
    # Get all menu items from all orders by menu_item_id

    all_items = []
    Order.all.each do |order|
      all_items << order.menu_item_ids
    end
    # Retuurn the array and flatten it
    all_items.flatten

    # Create a empty hash. For each item in the all_items array, add it as a key in the array. Each time an array item appears, add one to the value for that key {Coffee > 10}
    freq = all_items.inject(Hash.new(0)) { |h,v| h[v] += 1; h }

    # Put in order by value, reverse it and return the first item
    freq.sort_by{|k,v| v}.reverse.flatten.first

    #Find the most popular item
    MenuItem.find_by_id(freq.sort_by{|k,v| v}.reverse.flatten.first)
  end

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
