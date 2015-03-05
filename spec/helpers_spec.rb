require 'spec_helper'

describe DeadSimpleAuthorization::Helpers do
  include DeadSimpleAuthorization::Helpers

  let(:user) { double }
  let(:post) { Post.new(user) }
 
  describe 'authorize' do
    it 'should raise error if user cannot access a resource' do
      expect { authorize(user, :own, Post.new(double)) }.to raise_error(DeadSimpleAuthorization::Errors::NotAuthorized)
    end

    it 'should do nothing if user can access a resource' do
      expect(authorize(user, :own, post)).to be_nil
    end
  end

  describe 'can?' do
    it 'should return false if user cannot access a resource' do
      expect(can?(user, :own, Post.new(double))).to equal false
    end

    it 'should return true if user can access a resource' do
      expect(can?(user, :own, post)).to equal true
    end
  end
end
