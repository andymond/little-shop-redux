describe "user can navigate through site from nav bar" do
  it "allows user to go to marketplace" do
    visit "/items"

    within(:xpath, '//div[@id="dc1"]') do
        click_on "Marketplace"
    end

    expect(current_path).to eq("/merchants")
  end

  it "allows user to go to create new merchant" do
    visit "/items"

    within(:xpath, '//div[@id="dc1"]') do
        click_on "Create New Merchant"
    end

    expect(current_path).to eq("/merchants/new")
  end

  it "allows user to go to merchant-dashboard" do
    Merchant.create(name: "GuitarDudesCrazyStore")
    Item.create(title: "Grizzlycorn",
                description: "It's the unholy merging of a grizzly bear and a unicorn!",
                price: 500_000,
                merchant_id: 1,
                category_id: 1,
                image: 'https://ih1.redbubble.net/image.11311357.5033/flat,800x800,075,f.jpg')

    visit "/items"

    within(:xpath, '//div[@id="dc1"]') do
        click_on "Merchants Dashboard"
    end

    expect(current_path).to eq("/merchants-dashboard")
  end

  it "allows user to go to item inventory" do
    visit "/items"

    within(:xpath, '//div[@id="dc2"]') do
        click_on "Inventory"
    end

   expect(current_path).to eq("/items")
  end

  it "allows user to go to create new item" do
    visit "/items"

    within(:xpath, '//div[@id="dc2"]') do
        click_on "Create New Item"
    end

    expect(current_path).to eq("/items/new")
  end

  it "allows user to go to items-dashboard" do
    Item.create(title: "Grizzlycorn",
                description: "It's the unholy merging of a grizzly bear and a unicorn!",
                price: 500_000,
                merchant_id: 1,
                category_id: 1,
                image: 'https://ih1.redbubble.net/image.11311357.5033/flat,800x800,075,f.jpg')

    visit "/items"

    within(:xpath, '//div[@id="dc2"]') do
        click_on "Items Dashboard"
    end

    expect(current_path).to eq("/items-dashboard")
  end

  it "allows user to go to categories" do
    visit "/items"

    within(:xpath, '//div[@id="dc3"]') do
        click_on "Browse By Category"
    end

    expect(current_path).to eq("/categories")
  end

  it "allows user to go to create new category" do
    visit "/items"

    within(:xpath, '//div[@id="dc3"]') do
        click_on "Create New Category"
    end

    expect(current_path).to eq("/categories/new")
  end

  it "allows user to go to categories-dashboard" do
    Item.create(title: "Grizzlycorn",
                description: "It's the unholy merging of a grizzly bear and a unicorn!",
                price: 500_000,
                merchant_id: 1,
                category_id: 1,
                image: 'https://ih1.redbubble.net/image.11311357.5033/flat,800x800,075,f.jpg')
    Category.create(name: "Food")

    visit "/items"

    within(:xpath, '//div[@id="dc3"]') do
        click_on "Categories Dashboard"
    end

    expect(current_path).to eq("/categories-dashboard")
  end

end
