defmodule EshopWeb.Schema.Mutations.TypeUserRole do
  use Absinthe.Schema.Notation
  
  object :type_user_role_mutations do
    @desc "Create a type_user_role"
    field :create_type_user_role, type: :type_user_role do 
      arg :id, :integer
    	arg :type, :integer
    	arg :type_id, :integer
    	arg :user_id, :id
    	arg :role_id, :id

    	resolve &EshopWeb.Schema.Resolvers.TypeUserRole.create_type_user_role/3
    end
  end 
end
