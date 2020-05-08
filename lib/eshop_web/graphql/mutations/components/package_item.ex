defmodule EshopWeb.Schema.Mutations.PackageItem do
  use Absinthe.Schema.Notation
  
  object :package_item_mutations do
    @desc "Create a package_item"
    field :create_package_item, type: :package_item do 
      arg :id, :integer
    	arg :name, :string
    	arg :native_name, :string
    	arg :package_id, :id

    	resolve &EshopWeb.Schema.Resolvers.PackageItem.create_package_item/2
    end
  end 
end
