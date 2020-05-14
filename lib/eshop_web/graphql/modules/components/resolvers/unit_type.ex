defmodule EshopWeb.Schema.Resolvers.Package do
	 
   	def list_unit_types(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_unit_types()}
    end

    def get_unit_type(_, %{id: id}, _) do
		{:ok, Eshop.Components.get_unit_type!(id)} 
	end 
	 
    def create_unit_type(_parent, args, _resolution) do
        Eshop.Components.create_unit_type(args)
    end 

    def update_unit_type(%{id: id, unit_type_params: unit_type_params}, _info) do
		case {:ok, Eshop.Components.get_unit_type!(id)} do
			{:ok, unit_type} -> unit_type |> Eshop.Components.update_unit_type(unit_type_params) 
		end  
	end

	def delete_unit_type(%{id: id}, _info) do 
		case {:ok, Eshop.Components.get_unit_type!(id)} do
			{:ok, unit_type} -> unit_type |> Eshop.Components.delete_unit_type() 
		end 
	end  
end
