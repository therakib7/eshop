defmodule EshopWeb.Schema.Mutations.PackageItem do
	use Absinthe.Schema.Notation
  
	alias EshopWeb.Schema.Resolvers.PackageItem, as: PackageItem
  
	object :package_item_mutations do
	  @desc "Create a package_item"
	  field :create_package_item, type: :package_item do 
		  arg :id, :integer
    	arg :name, :string
    	arg :native_name, :string
    	arg :package_id, :id
      
		  resolve &PackageItem.create_package_item/3
	  end
  
	  @desc "Update a package_item"
	  field :update_package_item, type: :package_item do
		  arg(:id, non_null(:id))
		  arg(:package_item_params, :package_item_params)
  
		  resolve &PackageItem.update_package_item/2
	  end
	  
	  @desc "Delete a package_item"
	  field :delete_package_item, type: :package_item do
		  arg(:id, non_null(:id))
		  resolve &PackageItem.delete_package_item/2
	  end
	end 
end