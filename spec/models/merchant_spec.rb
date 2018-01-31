describe Merchant do
  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        merchant = Merchant.create()

        expect(merchant).to_not be_valid
      end

      it "is invalid if its not unique" do
        merchant_1 = Merchant.create(name: "Pepsi")
        merchant_2 = Merchant.create(name: "Pepsi")

        expect(merchant_2).to_not be_valid
        expect(merchant_1).to be_valid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        merchant = Merchant.create(name: "Pepsi")

        expect(merchant).to be_valid
      end

      it "is valid if it is unique" do
        merchant_1 = Merchant.create(name: "Pepsi")
        merchant_2 = Merchant.create(name: "Coke")

        expect(merchant_2).to be_valid
        expect(merchant_1).to be_valid
      end
    end
  end
  describe "Instance Methods" do
    it "returns total items" do
      merchant = Merchant.create(name: 'DoopDoot')
      merchant.items.create(title: "Doot",
                            description: "DoopDoot's doot",
                            price: 5000,
                            image: 'heya.jpg')
      merchant.items.create(title: "Doop",
                            description: "DoopDoot's doop",
                            price: 5000,
                            image: 'heya.jpg')

      expect(merchant.total_items).to eq(2)
    end

    it "returns total price of items" do
      merchant = Merchant.create(name: 'DoopDoot')
      merchant.items.create(title: "Doot",
                            description: "DoopDoot's doot",
                            price: 5000,
                            image: 'heya.jpg')
      merchant.items.create(title: "Doop",
                            description: "DoopDoot's doop",
                            price: 5000,
                            image: 'heya.jpg')

      expect(merchant.total_items_price).to eq(10000)
    end
  end

  describe "Class Methods" do
    it "returns merchant with most items" do
      gruncle = Merchant.create(name: 'Gruncle Stan')
      dinglemime = Merchant.create(name: 'Dinglemime')
      bojangles = Merchant.create(name: 'Bojangles')
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

      expect(Merchant.all.merchant_with_most_items.first).to eq(gruncle)
    end

    it "returns merchant with highest item price" do
      gruncle = Merchant.create(name: 'Gruncle Stan')
      dinglemime = Merchant.create(name: 'Dinglemime')
      bojangles = Merchant.create(name: 'Bojangles')
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
      expect(Merchant.all.merchant_with_highest_priced_item).to eq(gruncle)
    end
  end
end
