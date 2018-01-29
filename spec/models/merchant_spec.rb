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
end
