describe "a user navigates to items/:id page for specific item" do
  describe "visit items/:id" do
    it "user sees one item based upon its id" do
      Item.create(title: 'Rock that looks like a face rock',
                  description: "It's a rock that looks like a face",
                  price: 200_000,
                  image: 'https://i.ytimg.com/vi/LsRTtjqmn0I/maxresdefault.jpg')
      Item.create(title: 'Sascrotch',
                  description: 'A hairy bipedal animal with tighty whiteys and a sassy disposition',
                  price: 500_000,
                  image: "https://vignette.wikia.nocookie.net/uncyclopedia/images/f/f9/S1e1_sascrotch.png/revision/latest?cb=20130304194223")
      visit "/items/2"

      expect(page).to have_content("Sascrotch")
      expect(page).to have_css("img[src*='https://vignette.wikia.nocookie.net/uncyclopedia/images/f/f9/S1e1_sascrotch.png/revision/latest?cb=20130304194223']")
    end
  end
end
