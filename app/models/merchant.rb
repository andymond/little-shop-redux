class Merchant < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :items
  scope :abc_order, -> {order('lower(name)')}

  def total_items_price
    items.sum(:price)
  end

  def total_items
    items.count
  end
end
