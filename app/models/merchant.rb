class Merchant < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :items

  def total_items_price
    items.sum(:price)
  end

  def total_items
    items.count
  end
end
