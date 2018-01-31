describe "user can edit merchant" do
  context "in the edit path" do
    it "can edit an existing merchant" do
      merchant = Merchant.create(name: "GuitarDudesCrazyStore")

      visit "/merchants/#{merchant.id}/edit"
      fill_in "merchant[name]", with: "GuitarPpl"

      click_on "Update"

      expect(page).to have_content("GuitarPpl")
    end
  end
end
