describe "a user navigates to items edit page" do
  describe "visit items/:id/edit" do
    it "user can edit current item title" do
      item = Item.create(title: 'Rock that looks like a face rock',
                         description: "It's a rock that looks like a face",
                         price: 200_000,
                         merchant_id: 2,
                         image: 'https://i.ytimg.com/vi/LsRTtjqmn0I/maxresdefault.jpg')
      visit "/items/#{item.id}/edit"

      fill_in "item[title]", with: "Different Face Rock"
      fill_in "item[description]", with: "A Face that looks like a rock!!"
      fill_in "item[price]", with: 300_000
      fill_in "item[image]", with: "https://vignette.wikia.nocookie.net/gravityfalls/images/d/d5/Pilot_The_Sascrotch.png/revision/latest?cb=20160803222628"
      click_on "Update"

      expect(page).to have_content("Different Face Rock")
      expect(page).to have_content("A Face that looks like a rock!!")
      expect(page).to have_content("$3000.00")
      expect(page).to have_xpath("//img[contains(@src,'https://vignette.wikia.nocookie.net/gravityfalls/images/d/d5/Pilot_The_Sascrotch.png/revision/latest?cb=20160803222628')]")
      expect(page).to_not have_content("Rock that looks like a face rock")
    end
  end
end
