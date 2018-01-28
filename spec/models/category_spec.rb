describe Category do
  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        category = Category.create()

        expect(category).to_not be_valid
      end

      it "is invalid if its not unique" do
        category_1 = Category.create(name: "Expensive")
        category_2 = Category.create(name: "Expensive")

        expect(category_2).to_not be_valid
        expect(category_1).to be_valid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        category = Category.create(name: "Cheap")

        expect(category).to be_valid
      end

      it "is valid if it is unique" do
        category_1 = Category.create(name: "Cheap")
        category_2 = Category.create(name: "Expensive")

        expect(category_1).to be_valid
        expect(category_2).to be_valid
      end
    end
  end
end