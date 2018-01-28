require 'csv'
require './app/models/merchant.rb'
require './app/models/item.rb'
require './app/models/category.rb'

Merchant.destroy_all
Item.destroy_all
Category.destroy_all

categories = CSV.open './data/categories.csv', headers: true, header_converters: :symbol
categories.each do |row|
  Category.create(id: row[:id],
                  name: row[:name],
                  updated_at: row[:updated_at],
                  created_at: row[:created_at])
end

merchants = CSV.open './data/merchants.csv', headers: true, header_converters: :symbol
merchants.each do |row|
  Merchant.create(id: row[:id],
                  name: row[:name],
                  updated_at: row[:updated_at],
                  created_at: row[:created_at])
end

items = CSV.open './data/items.csv', headers: true, header_converters: :symbol
items.each do |row|
Item.create(id: row[:id],
            title: row[:name],
            description: row[:description],
            price: row[:unit_price],
            updated_at: row[:updated_at],
            created_at: row[:created_at],
            merchant_id: row[:merchant_id],
            image: 'https://openclipart.org/image/2400px/svg_to_png/227732/Potion.png')
end
