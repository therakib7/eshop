defmodule EshopWeb.Schema.Resolvers.DiscountCode do
	 
   	def list_iscount_codes(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_iscount_codes()}
    end

    def get_iscount_code(_, %{id: id}, _) do
		{:ok, Eshop.Components.get_iscount_code!(id)} 
	end 
	 
    def create_iscount_code(_parent, args, _resolution) do
        Eshop.Components.create_iscount_code(args)
    end 

    def update_iscount_code(%{id: id, iscount_code_params: iscount_code_params}, _info) do
		case {:ok, Eshop.Components.get_iscount_code!(id)} do
			{:ok, iscount_code} -> iscount_code |> Eshop.Components.update_iscount_code(iscount_code_params) 
		end  
	end

	def delete_iscount_code(%{id: id}, _info) do 
		case {:ok, Eshop.Components.get_iscount_code!(id)} do
			{:ok, iscount_code} -> iscount_code |> Eshop.Components.delete_iscount_code() 
		end 
	end  
end
