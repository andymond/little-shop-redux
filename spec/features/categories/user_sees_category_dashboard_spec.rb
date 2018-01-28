describe "user navigates to Category Dashboard" do
  it "shows user appropriate category statistics" do
    Category.create(name: "Cool")
    Category.create(name: "Rad")
    Category.create(name: "Baller")
    Item.create(title: 'Rock that looks like a face rock',
                description: "It's a rock that looks like a face",
                price: 200_000,
                merchant_id: 2,
                category_id: 2,
                image: 'https://i.ytimg.com/vi/LsRTtjqmn0I/maxresdefault.jpg')

    visit "/categories-dashboard"

    expect(page).to have_content("Cool")
    expect(page).to have_content("Rad")
    expect(page).to have_content("Baller")
  end
end
