describe "a user can see stats for items" do
  context "when a user is on /items-dashboard" do
    it "I can see stats for items" do
      Item.create(title: 'Rock that looks like a face rock',
                  description: "It's a rock that looks like a face",
                  price: 200_000,
                  merchant_id: 2,
                  image: 'https://i.ytimg.com/vi/LsRTtjqmn0I/maxresdefault.jpg')
      Item.create(title: "Grizzlycorn",
                  description: "It's the unholy merging of a grizzly bear and a unicorn!",
                  price: 500_000,
                  merchant_id: 1,
                  image: 'https://ih1.redbubble.net/image.11311357.5033/flat,800x800,075,f.jpg')
      Item.create(title: "Beevercorn",
                  description: "The abominable merging of a beever and a unicorn!",
                  price: 20_000,
                  merchant_id: 1,
                  image: 'https://vignette.wikia.nocookie.net/gravityfalls/images/1/1e/S1e13_beavercorn.png/revision/latest?cb=20130405054024')
      visit '/items-dashboard'

      expect(page).to have_content('Average Price of Items: 240000.0')
      expect(page).to have_content('Total Items: 3')
      expect(page).to have_content('Newest Item: Beevercorn')
      expect(page).to have_content('Oldest Item: Rock that looks like a face rock')

    end
  end
end
