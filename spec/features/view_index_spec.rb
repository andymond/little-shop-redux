describe "Index" do
  describe "open index page" do
    it "displays all merchants names" do
      Merchant.create(name: 'Bojangles')
      Merchant.create(name: 'Dinglemime')
      visit '/merchants'

      expect(page).to have_content("Bojangles")
      expect(page).to have_content("Dinglemime")
    end

    it "deletes a given merchant by its id" do
      Merchant.create(name: 'Bojangles')
      visit '/merchants'

      save_and_open_page
    end
  end
end
