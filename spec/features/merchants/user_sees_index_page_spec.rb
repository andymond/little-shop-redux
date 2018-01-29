describe "a user navigates to the merchants index page" do
  context "visit /merchants" do
    it "users see all merchants" do
      Merchant.create(name: 'Gruncle Stan')
      Merchant.create(name: 'Dinglemime')
      Merchant.create(name: 'DootDoop')
      visit '/merchants'

      expect(page).to have_content("Gruncle Stan")
      expect(page).to have_content("Dinglemime")
      expect(page).to have_content("DootDoop")
    end
  end
end
