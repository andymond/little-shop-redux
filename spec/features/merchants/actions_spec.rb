
describe "Actions" do
  describe 'New' do
    it 'can create a new merchant' do
      visit '/merchants/new'

      fill_in "merchant[name]",	with: "Pepsi"
      click_on "Submit"

      expect(page).to have_content("Pepsi")
    end
  end

  describe "Edit" do
    it "can edit an existing merchant" do
      merchant = Merchant.create(name: "GuitarDudesCrazyStore")

      visit "/merchants/#{merchant.id}/edit"
      fill_in "merchant[name]", with: "GuitarPpl"

      click_on "Submit"

      expect(page).to have_content("GuitarPpl")
    end
  end
end
