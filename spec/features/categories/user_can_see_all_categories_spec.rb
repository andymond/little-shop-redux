describe "user can see all categories" do
  context "when im on the index page" do
    it "they can see all the categories" do
      category_1 = Category.create(name: "Toys")
      category_2 = Category.create(name: "Supplies")
      category_3 = Category.create(name: "Clothing")

      visit "/categories"

      expect(page).to have_content("Toys")
      expect(page).to have_content("Supplies")
      expect(page).to have_content("Clothing")
      expect(current_path).to eq("/categories")
    end
  end
end

