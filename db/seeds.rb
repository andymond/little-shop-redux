require 'csv'
require './app/models/merchant.rb'

Merchant.destroy_all

merchants = CSV.open './data/merchants.csv', headers: true, header_converters: :symbol
merchants.each do |row|
  Merchant.create(id: row[:id],
                  name: row[:name],
                  updated_at: row[:updated_at],
                  created_at: row[:created_at])
end
