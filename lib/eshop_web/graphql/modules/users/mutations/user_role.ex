defmodule EshopWeb.Schema.Mutations.UserRole do
	use Absinthe.Schema.Notation
  
	alias EshopWeb.Schema.Resolvers.UserRole, as: UserRole
  
	object :user_role_mutations do
	  @desc "Create a user_role"
	  field :create_user_role, type: :user_role do 
		  arg :id, :integer
      arg :user_id, :id
      arg :role_id, :id
      
		  resolve &UserRole.create_user_role/3
	  end
  
	  @desc "Update a user_role"
	  field :update_user_role, type: :user_role do
		  arg(:id, non_null(:id))
		  arg(:user_role_params, :user_role_params)
  
		  resolve &UserRole.update_user_role/2
	  end
	  
	  @desc "Delete a user_role"
	  field :delete_user_role, type: :user_role do
		  arg(:id, non_null(:id))
		  resolve &UserRole.delete_user_role/2
	  end
	end 
end