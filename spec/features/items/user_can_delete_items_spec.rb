describe "user can delete items from index page" do
  describe "visit items index" do
    it "user can delete items" do
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
      visit '/items'

      within("#item2") do
        click_on 'delete'
      end

      expect(page).to_not have_content("Grizzlycorn")
    end
  end
end
describe "user navigates to items index page" do
  describe "visit /items" do
    it "user can delete items" do
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
      visit '/items'

      within("#item2") do
        click_on 'delete'
      end

      expect(page).to_not have_content("Grizzlycorn")
    end
  end
end
