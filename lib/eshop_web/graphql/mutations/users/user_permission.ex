defmodule EshopWeb.Schema.Mutations.UserPermission do
    use Absinthe.Schema.Notation
    
    object :user_permission_mutations do
        @desc "Create a user_permission"
        field :create_user_permission, type: :user_permission do 
    		arg :id, :integer
            arg :user_id, :id
            arg :permission_id, :id

            resolve &EshopWeb.Schema.Resolvers.UserPermission.create_user_permission/3
        end
    end 
end