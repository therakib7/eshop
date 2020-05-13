defmodule EshopWeb.Schema.Resolvers.WarehouseVariantValue do
	 
   	def list_warehouse_variant_values(_parent, _args, _resolution) do
        {:ok, Eshop.Companies.list_warehouse_variant_values()}
    end

    def get_warehouse_variant_value(_, %{id: id}, _) do
		{:ok, Eshop.Companies.get_warehouse_variant_value!(id)} 
	end 
	 
    def create_warehouse_variant_value(_parent, args, _resolution) do
        Eshop.Companies.create_warehouse_variant_value(args)
    end 

    def update_warehouse_variant_value(%{id: id, warehouse_variant_value_params: warehouse_variant_value_params}, _info) do
		case {:ok, Eshop.Companies.get_warehouse_variant_value!(id)} do
			{:ok, warehouse_variant_value} -> warehouse_variant_value |> Eshop.Companies.update_warehouse_variant_value(warehouse_variant_value_params) 
		end  
	end

	def delete_warehouse_variant_value(%{id: id}, _info) do 
		case {:ok, Eshop.Companies.get_warehouse_variant_value!(id)} do
			{:ok, warehouse_variant_value} -> warehouse_variant_value |> Eshop.Companies.delete_warehouse_variant_value() 
		end 
	end  
end
