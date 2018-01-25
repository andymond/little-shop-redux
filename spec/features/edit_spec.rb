describe "Edit" do
  it "can edit an existing merchant" do
    merchant = Merchant.create(name: "GuitarDudesCrazyStore")

    visit "/merchants/#{merchant.id}/edit"
    fill_in "merchant[name]", with: "GuitarPpl"
    save_and_open_page
    click_on "Submit"

    expect(page).to have_content("GuitarPpl")
  end
end
