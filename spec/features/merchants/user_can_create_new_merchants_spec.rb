require 'spec_helper'

describe 'as a user' do
  it 'can create a new merchant' do
    visit '/merchants/new'

    fill_in "merchant[name]",	with: "Pepsi"
    click_on "Submit"

    expect(page).to have_content("Pepsi")
  end
end
