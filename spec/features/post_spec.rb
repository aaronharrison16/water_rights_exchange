require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do 
      visit posts_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'can be reached by clicking edit on index page' do
      post = FactoryBot.create(:post)
      visit posts_path

      click_link("edit_#{@post.id}")
      expect(page.status_code).to eq(200)
    end
  end
end

describe 'creation' do
  before do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user) 
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

  it 'will have a user associated it' do
    fill_in 'post[title]', with: 'User Title'
    fill_in 'post[available]', with: '88'
    fill_in 'post[price]', with: '1800'
    fill_in 'post[address]', with: "123 West Any Street"
    fill_in 'post[location]', with: 'Any Location'
    click_on 'Save'

    expect(User.last.posts.last.title).to eq("User Title")
  end
end

describe 'delete' do
  it 'can be deleted' do
    @post = FactoryBot.create(:post)
    visit posts_path

    click_link("delete_post_#{@post.id}_from_index")
    expect(page.status_code).to eq(200)
  end
end