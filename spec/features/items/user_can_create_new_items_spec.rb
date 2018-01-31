describe "a user navigates to the items create page" do
  describe "visit /items/new" do
    it "user can create new items" do
      merchant = Merchant.create(name: "ChimeraDealer")
      visit "/items/new"

      fill_in "item[title]", with: "Grizzlycorn"
      fill_in "item[description]", with: "It's the unholy merging of a grizzly bear and a unicorn!"
      fill_in "item[price]", with: 500_000
      fill_in "item[image]", with: 'https://ih1.redbubble.net/image.11311357.5033/flat,800x800,075,f.jpg'
      find('#merchant_select').find(:xpath, '//*[@id="ChimeraDealer"]').click
      click_on "Create"

      expect(current_path).to eq('/items')
      expect(page).to have_content("Grizzlycorn")
      expect(page).to have_content("It's the unholy merging of a grizzly bear and a unicorn!")
    end
  end
end
