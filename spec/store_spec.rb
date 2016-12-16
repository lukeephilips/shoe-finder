require('spec_helper')

describe(Store) do
  before do
    @shoe = Shoe.create(:name => 'Nike')
    @shoe2 = Shoe.create(:name => 'Adidas')
    @store = Store.create(:name => 'Kmart')
    @store = Store.create(:name => 'Target')
  end

  describe('#shoes') do
    it('returns the shoes that belong to a store') do
      @store.update(:shoe_ids => [@shoe.id, @shoe2.id])
      expect(@store.shoes).to(eq([@shoe, @shoe2]))
    end
  end
end
