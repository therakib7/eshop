defmodule EshopWeb.Schema.Mutations.RolePermission do
	use Absinthe.Schema.Notation
  
	alias EshopWeb.Schema.Resolvers.RolePermission, as: RolePermission
  
	object :role_permission_mutations do
	  @desc "Create a role_permission"
	  field :create_role_permission, type: :role_permission do 
		  arg :id, :integer
      arg :role_id, :id
      arg :role_permission_id, :id  
      
		  resolve &RolePermission.create_role_permission/3
	  end
  
	  @desc "Update a role_permission"
	  field :update_role_permission, type: :role_permission do
		  arg(:id, non_null(:id))
		  arg(:role_permission_params, :role_permission_params)
  
		  resolve &RolePermission.update_role_permission/2
	  end
	  
	  @desc "Delete a role_permission"
	  field :delete_role_permission, type: :role_permission do
		  arg(:id, non_null(:id))
		  resolve &RolePermission.delete_role_permission/2
	  end
	end 
end