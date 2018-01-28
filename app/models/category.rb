class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :items

  def avg_price
    items.map do |item|
      item.price
    end.sum / items.count
  end
end
