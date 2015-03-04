require 'minitest/autorun'
require 'dead_simple_authorization'
require 'fakes'

class DeadSimpleAuthorizationTest < Minitest::Test
  def test_authorize_user_can_access_resource
    sut = Checker.new
    assert_raises(DeadSimpleAuthorization::Errors::NotAuthorized) do
      sut.check_authorize(User.new, :own, Post.new(User.new))
    end
  end

  def test_authorize_user_cannot_access_resource
    sut = Checker.new
    user = User.new
    assert_nil sut.check_authorize(user, :own, Post.new(user))
  end

  def test_can_user_can_access_resource
    sut = Checker.new
    assert sut.check_can?(User.new, :own, Post.new(User.new)) == false
  end

  def test_can_user_cannot_access_resource
    sut = Checker.new
    user = User.new
    assert sut.check_can?(user, :own, Post.new(user)) == true
  end
end
