class Item < ActiveRecord::Base
  validates_presence_of :title, :description, :price, :image, :merchant_id
  belongs_to :merchant
end
