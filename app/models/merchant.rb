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

  def self.merchant_with_most_items
    joins(:items).select(
      "merchants.*, count(items.id) as icount").group(
        "merchants.id").order(
          "icount DESC").first
  end

  def self.merchant_with_highest_priced_item
    joins(:items).order('price DESC').first
  end
end
