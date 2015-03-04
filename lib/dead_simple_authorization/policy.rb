module DeadSimpleAuthorization
    module Policy
        class Base
            attr_reader :resource
            attr_reader :user

            #
            # The resource (e.g. a model) and user objects are available in all Policy objects
            # that inherit from BasePolicy and can be used by authorize action methods.
            #
            def initialize(resource, user)
                @user = user
                @resource = resource
            end
        end
    end
end
