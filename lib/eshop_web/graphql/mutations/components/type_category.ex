defmodule EshopWeb.Schema.Mutations.TypeCategory do
	use Absinthe.Schema.Notation
  
	alias EshopWeb.Schema.Resolvers.TypeCategory, as: TypeCategory
  
	object :type_category_mutations do
	  @desc "Create a type_category"
	  field :create_type_category, type: :type_category do 
		  arg :id, :integer
    	arg :type, :integer
    	arg :type_id, :integer
    	arg :category_id, :id
      
		  resolve &TypeCategory.create_type_category/3
	  end
  
	  @desc "Update a type_category"
	  field :update_type_category, type: :type_category do
		  arg(:id, non_null(:id))
		  arg(:type_category_params, :type_category_params)
  
		  resolve &TypeCategory.update_type_category/2
	  end
	  
	  @desc "Delete a type_category"
	  field :delete_type_category, type: :type_category do
		  arg(:id, non_null(:id))
		  resolve &TypeCategory.delete_type_category/2
	  end
	end 
end