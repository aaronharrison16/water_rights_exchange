require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end
end

describe 'creation' do
  before do 
    visit new_post_path
  end
  
  it 'has a new form that can be reached' do 
    expect(page.status_code).to eq(200)
  end

  it 'can be created from the new form page' do
    fill_in 'post[title]', with: 'Test Title'
    fill_in 'post[available]', with: '88'
    fill_in 'post[price]', with: '1800'
    fill_in 'post[address]', with: "123 West Any Street"
    fill_in 'post[location]', with: 'Any Location'
    click_on 'Save'

    expect(page).to have_content("Test Title")
  end
end