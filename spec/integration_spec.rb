require('spec_helper')

describe('the home path', {:type => :feature}) do
  before do
    visit '/'
  end
  it 'loads' do
    expect(page).to have_content "Shoe Finder"
  end
  it 'allows adding a shoe' do
    fill_in('shoe_name', :with => 'gucci')
      click_button('Add shoe')
      expect(page).to have_content "Gucci"
  end
  it 'allows adding a store' do
    fill_in('store_name', :with => 'target')
      click_button('Add store')
      expect(page).to have_content "Target"
  end
  it 'allows viewing a stores shoes' do
    fill_in('store_name', :with => 'target')
      click_button('Add store')

    fill_in('shoe_name', :with => 'gucci')
      click_button('Add shoe')

    select('Gucci', :from => 'shoe_to')
    select('Target', :from => 'to_store')
    click_button('Add')
    
    expect(page).to have_content "Target"
    expect(page).to have_content "Gucci"

  end
end
