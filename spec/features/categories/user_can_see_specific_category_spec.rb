describe "as a user I can see a single category" do
  context "on the show page" do
    it "I see one category" do
      category_1 = Category.create(name: "Games")
      category_2 = Category.create(name: "Food")

      visit "categories/#{category_2.id}"

      expect(page).to have_content(category_2.name)
      expect(page).to have_content("Food")
    end
  end
end
