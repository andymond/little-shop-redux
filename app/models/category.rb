class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :items

  def avg_price
    if items.count != 0
      items.map do |item|
        item.price
      end.sum / items.count
    else
      0
    end
  end

end
