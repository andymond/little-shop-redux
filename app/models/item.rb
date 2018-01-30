class Item < ActiveRecord::Base
  validates_presence_of :title, :description, :price, :image, :merchant_id
  belongs_to :merchant
  belongs_to :category

  def self.merchant_with_most_items
    Merchant.all.joins(:items).select(
      "merchants.*, count(items.id) as icount").group(
        "merchants.id").order(
          "icount DESC").first
  end

  def self.merchant_with_highest_priced_item
    Item.find_by(
      price: (Item.maximum(:price))
    ).merchant
  end
end
