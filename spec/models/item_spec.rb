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
end
