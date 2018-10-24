require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do 
      @post = FactoryBot.create(:post)
    end

    it 'can be created' do
      expect(@post).to be_valid
    end

    it 'cannot be created without a title' do
      @post.title = nil

      expect(@post).to_not be_valid
    end

    it 'cannot be created without number available' do 
      @post.available = nil

      expect(@post).to_not be_valid
    end

    it 'cannot be created without price' do 
      @post.price = nil

      expect(@post).to_not be_valid
    end

    it 'cannot be created without address' do 
      @post.address = nil

      expect(@post).to_not be_valid
    end
  end
end