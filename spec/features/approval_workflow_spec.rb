require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = FactoryBot.create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end

  describe 'edit' do
    before do
      @post = FactoryBot.create(:post)
    end

    it 'status cannot be edited by a non admin user' do 
      logout (:user)
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)

      visit edit_post_path(@post)

      expect(page).to_not have_content('Approved')
    end

    it 'should not be editable by the post creator if status is approved' do
      logout(:user)
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)

      @post.update(user_id: user.id, status: 'approved')

      visit edit_post_path(@post)

      expect(current_path).to eq(root_path)
    end
  end
end