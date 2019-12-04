class Order < ApplicationRecord
  belongs_to :user
  belongs_to :menu_item
end
