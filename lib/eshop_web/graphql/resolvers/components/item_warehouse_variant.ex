defmodule EshopWeb.Schema.Resolvers.ItemWarehouseVariant do
	 
   	def list_item_warehouse_variants(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_item_warehouse_variants()}
    end

    def get_item_warehouse_variant(_, %{id: id}, _) do
		{:ok, Eshop.Components.get_item_warehouse_variant!(id)} 
	end 
	 
    def create_item_warehouse_variant(_parent, args, _resolution) do
        Eshop.Components.create_item_warehouse_variant(args)
    end 

    def update_item_warehouse_variant(%{id: id, item_warehouse_variant_params: item_warehouse_variant_params}, _info) do
		case {:ok, Eshop.Components.get_item_warehouse_variant!(id)} do
			{:ok, item_warehouse_variant} -> item_warehouse_variant |> Eshop.Components.update_item_warehouse_variant(item_warehouse_variant_params) 
		end  
	end

	def delete_item_warehouse_variant(%{id: id}, _info) do 
		case {:ok, Eshop.Components.get_item_warehouse_variant!(id)} do
			{:ok, item_warehouse_variant} -> item_warehouse_variant |> Eshop.Components.delete_item_warehouse_variant() 
		end 
	end  
end
