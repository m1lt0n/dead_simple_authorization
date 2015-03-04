module DeadSimpleAuthorization
    module Helpers
        private
        #
        # Check if a user can perform an action for a specific resource.
        # If the user shouldn't have access to the resource, a
        # NotAuthorizedErrror is raised.
        #
        # Example: Is Bob allowed to view a Post ?
        #
        # Assuming bob = User.new('bob'), post = Post.new('post title', 'post content')
        #
        # authorize(bob, :view, post) will check for a PostPolicy by convention and will
        # trigger the policy's view? method. In the PostPolicy's context, the user and post
        # are available.
        #
        def authorize(user, action, resource)
            raise ::DeadSimpleAuthorization::Errors::NotAuthorized unless can?(user, action, resource)
        end

        #
        # Check if a user can perform an action for a specific resource.
        # This method is not as strict as authorize in a sense that it does not raise an
        # error, but returns the boolean outcome of the check
        #
        def can?(user, action, resource)
            policy_class = "#{resource.class}Policy"
            policy = Object::const_get(policy_class).new(resource, user)
            policy.send("#{action.to_s}?")
        end
    end
end
