describe "a user navigates to the items index page" do
  context "visit /items" do
    it "users see all items on the page" do
      Item.create(title: 'Rock that looks like a face rock',
                  description: "It's a rock that looks like a face",
                  price: 200_00,
                  merchant_id: 1,
                  image: 'https://i.ytimg.com/vi/LsRTtjqmn0I/maxresdefault.jpg')
      Item.create(title: 'Sascrotch',
                  description: 'A hairy bipedal animal with tighty whiteys and a sassy disposition',
                  price: 500_000,
                  merchant_id: 2,
                  image: "https://vignette.wikia.nocookie.net/uncyclopedia/images/f/f9/S1e1_sascrotch.png/revision/latest?cb=20130304194223")
      visit '/items'

      expect(page).to have_content("Rock that looks like a face rock")
      expect(page).to have_content("Sascrotch")
      expect(page).to have_content("It's a rock that looks like a face")
      expect(page).to have_content("20000")
      expect(page).to have_content("A hairy bipedal animal with tighty whiteys and a sassy disposition")
    end
  end
end
