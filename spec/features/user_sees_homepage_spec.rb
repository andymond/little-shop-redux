describe "User sees homepage when visiting root" do
  it "displays homepage" do
    visit "/"

    expect(page).to have_content("Welcome to the Town Bizzare!")
    expect(page).to have_content("Enter Bizzare")
  end
end
