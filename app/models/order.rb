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

    # TODO: Confirm that this function is running/updating each time an order is created *OR* updated
    # It should work like this:
    #
    # items = [1,1,1,2,3]
    # hash = all_items.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    # // {1=>3, 2=>1, 3=>1}
    # sorted_hash = hash.sort_by{|k,v| v}.reverse
    # // [[1, 3], [3, 1], [2, 1]]
    # hash.sort_by{|k,v| v}.reverse.first
    # [1, 3]
    # MenuItem.find_by_id(sorted_hash[1])
    # // Macchiato

    all_items = []
    Order.all.each do |order|
      all_items << order.menu_item_ids
    end

    # Return the array and flatten it
    all_items.flatten!

    # Create a empty hash. For each item in the all_items array, add it as a key in the array. Each time an array item appears, add one to the value for that key
    freq = all_items.inject(Hash.new(0)) { |h,v| h[v] += 1; h }

    # Put in order by value, reverse it (high to low)
    ordered_freq = freq.sort_by{|k,v| v}.reverse

    # Remember that this is now a nested array. For example: [[1, 16], [7, 16], [2, 14]]
    # ordered_freq.first does return the ID of the most popular item....
    # But navigating the nested array with ordered_freq[0][0] is better. This will get the key, of the first array, within ordered_freq
    # ordered_freq[0][1] returns the value of the first array, within ordered_freq

    # Find the most popular item
    most_popular_item = MenuItem.find_by_id(ordered_freq[0][0])

    puts "#{most_popular_item.name} is the most popular item, currently appearing in #{ordered_freq[0][1]} orders"

    # Return the most popular item!
    most_popular_item

  end

  def time_taken
    created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def total
    total = 0
    self.menu_items.each do |item|
      total += item.price
    end
    "$#{total}"
  end

  def status
    if self.completed == false
      "In Progress"
    else
      "Completed"
    end
  end
end
