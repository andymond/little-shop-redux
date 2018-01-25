describe "a user navigates to the items index page" do
  context "visit /items" do
    it "users see all items on the page" do
      Item.create(name: 'Rock that looks like a face rock',
                  description: "It's a rock that looks like a face",
                  price: 200_00,
                  image: 'https://i.ytimg.com/vi/LsRTtjqmn0I/maxresdefault.jpg')
      Item.create(name: 'Sascrotch',
                  description: 'A hairy bipedal animal with tighty whiteys and a sassy disposition'
                  price: 500_000,
                  image: "https://vignette.wikia.nocookie.net/uncyclopedia/images/f/f9/S1e1_sascrotch.png/revision/latest?cb=20130304194223")
      visit '/items'

      expect(page).to have_content("Rock that looks like a face rock")
      expect(page).to have_content("Sascrotch")
    end
  end
end
