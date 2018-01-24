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

      it "is valid if its unique" do
        merchant_1 = Merchant.create(name: "Pepsi")
        merchant_2 = Merchant.create(name: "Coke")

        expect(merchant_2).to be_valid
        expect(merchant_1).to be_valid
      end
    end
  end
end
