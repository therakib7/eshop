defmodule EshopWeb.Schema.Mutations.UserRole do
    use Absinthe.Schema.Notation
    
    object :user_role_mutations do
        @desc "Create a user_role"
        field :create_user_role, type: :user_role do 
            arg :id, :integer
			arg :user_id, :id
			arg :role_id, :id

            resolve &EshopWeb.Schema.Resolvers.UserRole.create_user_role/3
        end
    end 
end