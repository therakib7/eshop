defmodule EshopWeb.Schema.Resolvers.ItemVariant do
	 
   	def list_item_variants(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_item_variants()}
    end

    def get_item_variant(_, %{id: id}, _) do
		{:ok, Eshop.Components.get_item_variant!(id)} 
	end 
	 
    def create_item_variant(_parent, args, _resolution) do
        Eshop.Components.create_item_variant(args)
    end 

    def update_item_variant(%{id: id, item_variant_params: item_variant_params}, _info) do
		case {:ok, Eshop.Components.get_item_variant!(id)} do
			{:ok, item_variant} -> item_variant |> Eshop.Components.update_item_variant(item_variant_params) 
		end  
	end

	def delete_item_variant(%{id: id}, _info) do 
		case {:ok, Eshop.Components.get_item_variant!(id)} do
			{:ok, item_variant} -> item_variant |> Eshop.Components.delete_item_variant() 
		end 
	end  
end
