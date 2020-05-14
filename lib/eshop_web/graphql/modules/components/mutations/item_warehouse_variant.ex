defmodule EshopWeb.Schema.Mutations.ItemWarehouseVariant do
	use Absinthe.Schema.Notation
  
	alias EshopWeb.Schema.Resolvers.ItemWarehouseVariant, as: ItemWarehouseVariant
  
	object :item_warehouse_variant_mutations do
	  @desc "Create a item_warehouse_variant"
	  field :create_item_warehouse_variant, type: :item_warehouse_variant do 
		  arg :id, :integer
    	arg :item_id, :id
    	arg :warehouse_variant_id, :id
    	arg :warehouse_variant_value_id, :id
      
		  resolve &ItemWarehouseVariant.create_item_warehouse_variant/3
	  end
  
	  @desc "Update a item_warehouse_variant"
	  field :update_item_warehouse_variant, type: :item_warehouse_variant do
		  arg(:id, non_null(:id))
		  arg(:item_warehouse_variant_params, :item_warehouse_variant_params)
  
		  resolve &ItemWarehouseVariant.update_item_warehouse_variant/2
	  end
	  
	  @desc "Delete a item_warehouse_variant"
	  field :delete_item_warehouse_variant, type: :item_warehouse_variant do
		  arg(:id, non_null(:id))
		  resolve &ItemWarehouseVariant.delete_item_warehouse_variant/2
	  end
	end 
end