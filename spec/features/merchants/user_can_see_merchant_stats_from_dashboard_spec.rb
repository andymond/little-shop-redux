describe "a user can see the stats of merchants" do
  context "when a user is on /merchants-dashboard" do
    it "user can see stats for merchants" do
      Merchant.create(name: 'Gruncle Stan')
      Merchant.create(name: 'Dinglemime')
      Merchant.create(name: 'Bojangles')
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
      Item.create(title: "Peanut Butter",
                  description: "A mixture of grassfed butter and whole peanuts",
                  price: 200,
                  merchant_id: 3,
                  image: 'something.jpg')
      visit '/merchants-dashboard'


      expect(page).to have_content('Merchant with the most items: Gruncle Stan')
      expect(page).to have_content('Merchant with the highest priced item: Gruncle Stan')
      expect(page).to have_content("Gruncle Stan total items: 2")
      expect(page).to have_content("Gruncle Stan total price of items: 520000")
      expect(page).to have_content("Dinglemime total price of items: 200000")
      expect(page).to have_content("Dinglemime total items: 1")
      expect(page).to have_content("Bojangles total items: 1")
      expect(page).to have_content("Bojangles total price of items: 200")
    end
  end
end
