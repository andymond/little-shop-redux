describe "a user navigates to the merchants creation page" do
  context "visit /merchants/new" do
    it "user can create new merchants" do
      visit '/merchants/new'

      fill_in "merchant[name]", with: 'Waddles'

      click_on "Create"


      expect(page).to have_content("Waddles")

      visit '/merchants/new'

      fill_in "merchant[name]", with: "Soos Ramirez"

      click_on "Create"

      expect(page).to have_content("Waddles")
      expect(page).to have_content("Soos Ramirez")
    end
  end
end
