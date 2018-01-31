describe "User sees 404 when visiting non-existent view" do
  it "displays 404 not found" do
    visit "/asbfg"

    expect(page).to have_content("Nothing Here!")
    expect(page.status_code).to eq(404)
  end
end
