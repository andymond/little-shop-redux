describe "Index" do
  describe "open index page" do
    it "displays all merchants names" do
      Merchant.create(name: 'Bojangles')
      Merchant.create(name: 'Dinglemime')
      visit '/merchants'

      expect(page).to have_content("Bojangles")
      expect(page).to have_content("Dinglemime")
    end
  end
end
