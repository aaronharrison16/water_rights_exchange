require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do 
      @post = Post.create(title: "Test Title", available: 12, price: 1500, address: "123 West Any Street", location: "Any Location")
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

    it 'cannot be created without location' do 
      @post.location = nil

      expect(@post).to_not be_valid
    end
  end
end