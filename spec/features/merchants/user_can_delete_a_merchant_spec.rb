describe "a user navigates to merchants index page" do
  context "visit /merchants" do
    it "user can delete merchants" do
      Merchant.create(name: 'Grunkle Stan')
      Merchant.create(name: 'Dipper Pines')
      Merchant.create(name: 'Mabel Pines')
      Merchant.create(name: 'Bill Cipher')
      visit '/merchants'

      within("#merchant4") do
        click_on 'delete'
      end

      expect(page.status_code).to eq(200)
      expect(page).to_not have_content("Bill Cipher")
      expect(page).to have_content("Grunkle Stan")
      expect(page).to have_content("Dipper Pines")
      expect(page).to have_content("Mabel Pines")
    end
  end
end
