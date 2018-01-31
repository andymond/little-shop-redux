describe "user can edit a category" do
  context "when I'm on the edit page" do
    it "I can change the name of a category" do
      category = Category.create(name: "Toys")

      visit "/categories/#{category.id}/edit"
      fill_in "category[name]",	with: "Supplies"
      find("form.category_edit").click_on "Submit"

      expect(page).to have_content("Supplies")
    end
  end
end
