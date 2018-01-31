describe "a user navigates to merchants/:id for specific merchant" do
  context "visit /merchants/:id" do
    it "a user can see specific merchant" do
      Merchant.create(name: 'Grunkle Stan')
      Merchant.create(name: 'Dipper Pines')
      Merchant.create(name: 'Mabel Pines')
      Merchant.create(name: 'Bill Cipher')
      visit '/merchants/2'

      expect(page).to have_content('Dipper Pines')

      visit '/merchants/3'

      expect(page).to have_content("Mabel Pines")
    end
  end
end
