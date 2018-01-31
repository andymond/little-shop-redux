describe "user can edit merchant" do
  context "in the edit path" do
    it "can edit an existing merchant" do
      merchant = Merchant.create(name: "GuitarDudesCrazyStore")

      visit "/merchants/#{merchant.id}/edit"
      fill_in "merchant[name]", with: "GuitarPpl"

      find("form.merchant_edit").click_on "Submit"

      expect(page).to have_content("GuitarPpl")
    end
  end
end
