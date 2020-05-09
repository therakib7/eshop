defmodule EshopWeb.Schema.Mutations.ItemWarehouseVariant do
  use Absinthe.Schema.Notation
  
  object :item_warehouse_variant_mutations do
    @desc "Create a item_warehouse_variant"
    field :create_item_warehouse_variant, type: :item_warehouse_variant do 
      arg :id, :integer
    	arg :item_id, :id
    	arg :warehouse_variant_id, :id
    	arg :warehouse_variant_value_id, :id

    	resolve &EshopWeb.Schema.Resolvers.ItemWarehouseVariant.create_user/3
    end
  end 
end
