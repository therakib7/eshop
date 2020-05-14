defmodule EshopWeb.Schema.Mutations.Variant do
	use Absinthe.Schema.Notation
  
	alias EshopWeb.Schema.Resolvers.Variant, as: Variant
  
	object :variant_mutations do
	  @desc "Create a variant"
	  field :create_variant, type: :variant do 
		  arg :id, :integer
    	arg :order, :integer
    	arg :name, :string
    	arg :native_name, :string
    	arg :type, :integer
    	arg :shop_id, :id
    	arg :user_id, :id
      
		  resolve &Variant.create_variant/3
	  end
  
	  @desc "Update a variant"
	  field :update_variant, type: :variant do
		  arg(:id, non_null(:id))
		  arg(:variant_params, :variant_params)
  
		  resolve &Variant.update_variant/2
	  end
	  
	  @desc "Delete a variant"
	  field :delete_variant, type: :variant do
		  arg(:id, non_null(:id))
		  resolve &Variant.delete_variant/2
	  end
	end 
end