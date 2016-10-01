# dead_simple_authorization

[![Gem Version](https://badge.fury.io/rb/dead_simple_authorization.png)](https://badge.fury.io/rb/dead_simple_authorization)

## What is dead_simple_authorization?
It's a simple gem for authorization. The main concepts around dead_simple_authorization are: users, resources and permissions. Using a couple of simple naming conventions, it organizes the way in which access to a resource (an activerecord model for example) by a user (e.g. a web application's user) is checked.

## What's included
The juice of this gem are the methods can? and authorize included in the module DeadSimpleAuthorization::Helpers. Both methods accept 3 arguments: a user, an action and a resource. For example can?(user, :update, post) checks if a user has the permission to update a post. The authorize method is the stricter of the two, as if the user doesn't have permission, it raises a DeadSimpleAuthorization::Errors::NotAuthorized error, while can? method only returns a boolean.

## Example usage
Think of a web application (e.g. a rails app), a blog for example, where there are Users and Posts and a user can be the owner of a Post. How would we create a simple authorization mechanism in this case?

Assume a Post contains the following (among other things):

```ruby
class Post < ActiveRecord::Base
  belongs_to :user
end
```

What we need is a place to put the rules for dead_simple_authorization. The convention is that a PostPolicy class holds those rules. This policy class inherits from DeadSimpleAuthorization::Policy::Base:

```ruby
class PostPolicy < DeadSimpleAuthorization::Policy::Base
  def update?
    user == resource.user
  end
end
```

Note that the Policy objects are instantiated with user and resource, so in this case user holds the user passed to the can? or authorize methods and resource a Post instance. That's it! Now, by including DeadSimpleAuthorization::Helpers in a controller for example, we can check permissions with either can? or authorize method this way:

```ruby
can?(current_user, :update, post)
```
or

```ruby
authorize(current_user, :update, post)
```

The convention when creating permission methods in PostPolicy is to have end in question mark, so by creating a rule such as update? the action that needs to be provided to authorize and can? methods is :update (i.e. the question mark needs to be removed and a symbol needs to be used).

That's pretty much it.
