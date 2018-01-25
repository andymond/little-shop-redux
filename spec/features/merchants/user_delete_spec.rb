describe "Delete" do
  describe "user can delete merchant" do
    it "deletes a given merchant by its id" do
      Merchant.create(name: 'Bojangles')
      visit '/merchants'
      click_on "delete"

      expect(page).to_not have_content("Bojangles")
    end
  end
end 
