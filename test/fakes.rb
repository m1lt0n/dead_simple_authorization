class User; end;

class PostPolicy < DeadSimpleAuthorization::Policy::Base
  def own?
    resource.owner == @user
  end
end

class Post
  attr_reader :owner

  def initialize(owner)
    @owner = owner
  end
end

class Checker
  include DeadSimpleAuthorization::Helpers

  def check_authorize(user, action, resource)
    authorize(user, action, resource)
  end

  def check_can?(user, action, resource)
    can?(user, action, resource)
  end
end

