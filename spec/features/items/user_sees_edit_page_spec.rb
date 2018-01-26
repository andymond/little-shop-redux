describe "a user navigates to items edit page" do
  describe "visit items/:id/edit" do
    it "user can edit current item title" do
      item = Item.create(title: 'Rock that looks like a face rock',
                  description: "It's a rock that looks like a face",
                  price: 200_000,
                  image: 'https://i.ytimg.com/vi/LsRTtjqmn0I/maxresdefault.jpg')
      visit "/items/#{item.id}/edit"

      fill_in "item[title]", with: "Different Face Rock"
      click_on "Submit"

      expect(page).to have_content("Different Face Rock")
      expect(page).to_not have_content("Rock that looks like a face rock")
    end
  end
end
