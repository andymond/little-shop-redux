describe "as a user I can see a single category" do
  context "on the show page" do
    it "I see one category" do
      category = Category.create(name: "Food")
      # category_2 = Category.create(name: "Food")

      visit "/categories/#{category.id}"

      # expect(page).to have_content(category_2.name)
      expect(page).to have_content("Food")


    end
  end
end
