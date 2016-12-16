require('spec_helper')

describe(Shoe) do
  before do
    @shoe = Shoe.create(:name => 'Nike')
    @shoe2 = Shoe.create(:name => 'Adidas')
    @store = Store.create(:name => 'Kmart')
    @store = Store.create(:name => 'Target')


  end
  describe('#create') do
    it('makes a shoe if name is provided') do
      expect(@shoe.name).to(eq('Nike'))
    end
  end
end
