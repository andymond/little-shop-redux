describe "a user navigates to the items create page" do
  describe "visit items/new" do
    it "user can create new items" do
      visit "/items/new"

      save_and_open_page

      fill_in "item[title]", with: "Grizzlycorn"
      fill_in "item[description]", with: "It's the unholy merging of a grizzly bear and a unicorn!"
      fill_in "item[price]", with: 500_000
      fill_in "item[image]", with: 'https://ih1.redbubble.net/image.11311357.5033/flat,800x800,075,f.jpg'
      click_on "Submit"

      expect(page).to have_content("Grizzlycorn")
      expect(page).to have_content("It's the unholy merging of a grizzly bear and a unicorn!")
    end
  end
end
