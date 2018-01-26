
describe "Actions" do
  describe 'New' do
    it 'creates a new merchant' do
      visit '/merchants/new'

      fill_in "merchant[name]",	with: "Pepsi"
      click_on "Submit"

      expect(page).to have_content("Pepsi")
    end
  end

  describe "Edit" do
    it "edits an existing merchant" do
      merchant = Merchant.create(name: "GuitarDudesCrazyStore")

      visit "/merchants/#{merchant.id}/edit"
      fill_in "merchant[name]", with: "GuitarPpl"

      click_on "Submit"

      expect(page).to have_content("GuitarPpl")
    end
  end

  describe "Delete" do
    it "deletes a given merchant by its id" do
      Merchant.create(name: 'Bojangles')
      visit '/merchants'
      click_on "delete"

      expect(page).to_not have_content("Bojangles")
    end
  end

  describe "Index" do
    it "displays all merchants names" do
      Merchant.create(name: 'Gruncle Stan')
      Merchant.create(name: 'Dinglemime')
      visit '/merchants'

      expect(page).to have_content("Gruncle Stan")
      expect(page).to have_content("Dinglemime")
    end
  end


end
