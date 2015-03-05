require 'dead_simple_authorization'

class PostPolicy < DeadSimpleAuthorization::Policy::Base
  def own?
    @user == @resource.owner
  end
end

class Post
  attr_reader :owner

  def initialize(owner)
    @owner = owner
  end
end
