describe "user can create a category" do
  context "when I'm on the new page" do
    it "I can create a new category" do

      visit "/categories/new"

      fill_in "category[name]",	with: "Toys"
      click_on "Create"

      expect(page).to have_content("Toys")
      expect(current_path).to eq("/categories")
    end
  end
end
