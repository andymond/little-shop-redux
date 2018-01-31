describe Item do
  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        item = Item.create(description: "It's the unholy merging of a grizzly bear and a unicorn!",
                           price: 500_000,
                           merchant_id: 5,
                           image: 'https://ih1.redbubble.net/image.11311357.5033/flat,800x800,075,f.jpg')

        expect(item).to_not be_valid
      end

      it "is invalid without a description" do
        item = Item.create(title: "Grizzlycorn",
                           price: 500_000,
                           merchant_id: 1,
                           image: 'https://ih1.redbubble.net/image.11311357.5033/flat,800x800,075,f.jpg')

        expect(item).to_not be_valid
      end
      it "is invalid without a price" do
        item = Item.create(title: "Grizzlycorn",
                           merchant_id: 1,
                           description: "It's the unholy merging of a grizzly bear and a unicorn!",
                           image: 'https://ih1.redbubble.net/image.11311357.5033/flat,800x800,075,f.jpg')

        expect(item).to_not be_valid
      end

      it "is invalid without a image" do
        item = Item.create(title: "Grizzlycorn",
                           merchant_id: 1,
                           description: "It's the unholy merging of a grizzly bear and a unicorn!",
                           price: 500_000)

        expect(item).to_not be_valid
      end

      it "is invalid without a merchant id" do
        item = Item.create(title: "Grizzlycorn",
                           description: "It's the unholy merging of a grizzly bear and a unicorn!",
                           price: 500_000,
                           image: 'https://ih1.redbubble.net/image.11311357.5033/flat,800x800,075,f.jpg')

        expect(item).to_not be_valid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        item = Item.create(title: "Grizzlycorn",
                           description: "It's the unholy merging of a grizzly bear and a unicorn!",
                           price: 500_000,
                           image: 'https://ih1.redbubble.net/image.11311357.5033/flat,800x800,075,f.jpg',
                           merchant_id: 1)

        expect(item).to be_valid
      end
    end
  end

  describe "Class Methods" do

    it "returns average price of items" do
      Item.create(title: 'Rock that looks like a face rock',
                  description: "It's a rock that looks like a face",
                  price: 200_000,
                  merchant_id: 2,
                  image: 'https://i.ytimg.com/vi/LsRTtjqmn0I/maxresdefault.jpg')
      Item.create(title: "Grizzlycorn",
                  description: "It's the unholy merging of a grizzly bear and a unicorn!",
                  price: 500_000,
                  merchant_id: 1,
                  image: 'https://ih1.redbubble.net/image.11311357.5033/flat,800x800,075,f.jpg')
      Item.create(title: "Beevercorn",
                  description: "The abominable merging of a beever and a unicorn!",
                  price: 20_000,
                  merchant_id: 1,
                  image: 'https://vignette.wikia.nocookie.net/gravityfalls/images/1/1e/S1e13_beavercorn.png/revision/latest?cb=20130405054024')
      Item.create(title: "Peanut Butter",
                  description: "A mixture of grassfed butter and whole peanuts",
                  price: 200,
                  merchant_id: 3,
                  image: 'something.jpg')

      expect(Item.all.average_price).to eq(180050)
    end

    it "returns newest item created" do
      Item.create(title: 'Rock that looks like a face rock',
                  description: "It's a rock that looks like a face",
                  price: 200_000,
                  merchant_id: 2,
                  image: 'https://i.ytimg.com/vi/LsRTtjqmn0I/maxresdefault.jpg')
      Item.create(title: "Grizzlycorn",
                  description: "It's the unholy merging of a grizzly bear and a unicorn!",
                  price: 500_000,
                  merchant_id: 1,
                  image: 'https://ih1.redbubble.net/image.11311357.5033/flat,800x800,075,f.jpg')
      Item.create(title: "Beevercorn",
                  description: "The abominable merging of a beever and a unicorn!",
                  price: 20_000,
                  merchant_id: 1,
                  image: 'https://vignette.wikia.nocookie.net/gravityfalls/images/1/1e/S1e13_beavercorn.png/revision/latest?cb=20130405054024')
      Item.create(title: "Peanut Butter",
                  description: "A mixture of grassfed butter and whole peanuts",
                  price: 200,
                  merchant_id: 3,
                  image: 'something.jpg')

      expect(Item.all.newest_item).to eq("Peanut Butter")
    end

    it "returns oldest item created" do
      Item.create(title: 'Rock that looks like a face rock',
                  description: "It's a rock that looks like a face",
                  price: 200_000,
                  merchant_id: 2,
                  image: 'https://i.ytimg.com/vi/LsRTtjqmn0I/maxresdefault.jpg')
      Item.create(title: "Grizzlycorn",
                  description: "It's the unholy merging of a grizzly bear and a unicorn!",
                  price: 500_000,
                  merchant_id: 1,
                  image: 'https://ih1.redbubble.net/image.11311357.5033/flat,800x800,075,f.jpg')
      Item.create(title: "Beevercorn",
                  description: "The abominable merging of a beever and a unicorn!",
                  price: 20_000,
                  merchant_id: 1,
                  image: 'https://vignette.wikia.nocookie.net/gravityfalls/images/1/1e/S1e13_beavercorn.png/revision/latest?cb=20130405054024')
      Item.create(title: "Peanut Butter",
                  description: "A mixture of grassfed butter and whole peanuts",
                  price: 200,
                  merchant_id: 3,
                  image: 'something.jpg')

      expect(Item.all.oldest_item).to eq("Rock that looks like a face rock")
    end
  end
end
