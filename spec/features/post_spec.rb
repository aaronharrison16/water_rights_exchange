require 'rails_helper'

describe 'navigate' do
  before do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user) 
  end

  describe 'index' do
    before do 
      visit posts_path
    end

    it 'can be reached successfully' do
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
    choose 'post_purpose_buy'
    choose 'share'
    find('#post_region_id').find(:xpath, 'option[2]').select_option
    select('Daggett', :from => 'post_division_id')
    fill_in 'post[title]', with: 'Test Title'
    fill_in 'post[available]', with: '88'
    fill_in 'post[price]', with: '1800'
    fill_in 'post[address]', with: "123 West Any Street"
    click_on 'Save'

    expect(page).to have_content("Test Title")
  end

  it 'will have a user associated it' do
    choose 'post_purpose_buy'
    choose 'acre_foot'
    fill_in 'post[title]', with: 'User Title'
    fill_in 'post[available]', with: '88'
    fill_in 'post[price]', with: '1800'
    fill_in 'post[address]', with: "123 West Any Street"
    click_on 'Save'

    expect(User.last.posts.last.title).to eq("User Title")
  end
end

describe 'edit' do
  before do
    @edit_user = User.create(first_name: "asdf", last_name: "asdf", email: "asdfasdf@asdf.com", password: "asdfasdf", password_confirmation: "asdfasdf", phone: '5555555555')
    login_as(@edit_user, :scope => :user)
    @edit_post = Post.create(title: "asdfasdf", available: 12, price: 1500, address: "123 West Any Street", user_id: @edit_user.id, purpose: 1, water_type: 1, region_id: 1, division_id: 1 )
  end

  it 'can be edited' do
    visit edit_post_path(@edit_post.id)

    fill_in 'post[title]', with: 'Edited content'
    
    click_on 'Save'

    expect(page).to have_content("Edited content")
  end

  it 'cannot be edited by a non authorized user' do
    logout(:user)
    non_authorized_user = FactoryBot.create(:non_authorized_user)
    login_as(non_authorized_user, :scope => :user)

    visit edit_post_path(@edit_post)

    expect(current_path).to eq(root_path)
  end

  it 'can not be edited by a guest user' do
    logout(:user)

    visit edit_post_path(@edit_post)
  
    expect(current_path).to eq(root_path)
  end
end