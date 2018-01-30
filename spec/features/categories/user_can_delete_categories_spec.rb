describe "user can delete categories form index page" do
  describe "visit categories index" do
    it "user can delete Categories" do
      category_1 = Category.create(name: "Food")
      category_2 = Category.create(name: "Toys")

      visit '/categories'

      within("#category#{category_2.id}") do
        click_on 'Delete'
      end
      expect(page).to_not have_content("Toys")
    end
  end
end
