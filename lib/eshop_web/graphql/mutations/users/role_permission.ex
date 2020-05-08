defmodule EshopWeb.Schema.Mutations.RolePermission do
    use Absinthe.Schema.Notation
    
    object :role_permission_mutations do
        @desc "Create a role_permission"
        field :create_role_permission, type: :role_permission do 
    		arg :id, :integer
            arg :role_id, :id
            arg :permission_id, :id

            resolve &EshopWeb.Schema.Resolvers.RolePermission.create_role_permission/2
        end
    end 
end