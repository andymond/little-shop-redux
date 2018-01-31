describe "user can edit a category" do
  context "when I'm on the edit page" do
    it "I can change the name of a category" do
      category = Category.create(name: "Toys")

      visit "/categories/#{category.id}/edit"
      
      fill_in "category[name]",	with: "Supplies"
      click_on "Update"

      expect(page).to have_content("Supplies")
    end
  end
end
