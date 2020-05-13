defmodule EshopWeb.Schema.Mutations.Permission do
	use Absinthe.Schema.Notation
  
	alias EshopWeb.Schema.Resolvers.Permission, as: Permission
  
	object :permission_mutations do
	  @desc "Create a permission"
	  field :create_permission, type: :permission do 
		  arg :id, :integer
      arg :name, :string
      arg :slug, :string
      arg :inserted_at, :naive_datetime
      arg :updated_at, :naive_datetime  
      
		  resolve &Permission.create_permission/3
	  end
  
	  @desc "Update a permission"
	  field :update_permission, type: :permission do
		  arg(:id, non_null(:id))
		  arg(:permission_params, :permission_params)
  
		  resolve &Permission.update_permission/2
	  end
	  
	  @desc "Delete a permission"
	  field :delete_permission, type: :permission do
		  arg(:id, non_null(:id))
		  resolve &Permission.delete_permission/2
	  end
	end 
end