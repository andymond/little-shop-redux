class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :items

  def avg_price
    avg = items.average(:price)
    avg ? avg / 100.0 : 0
  end

end
