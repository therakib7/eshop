defmodule EshopWeb.Schema.Resolvers.Guarantee do
	 
   	def list_guarantees(_parent, _args, _resolution) do
        {:ok, Eshop.Conditions.list_guarantees()}
    end

    def get_guarantee(_, %{id: id}, _) do
		{:ok, Eshop.Conditions.get_guarantee!(id)} 
	end 
	 
    def create_guarantee(_parent, args, _resolution) do
        Eshop.Conditions.create_guarantee(args)
    end 

    def update_guarantee(%{id: id, guarantee_params: guarantee_params}, _info) do
		case {:ok, Eshop.Conditions.get_guarantee!(id)} do
			{:ok, guarantee} -> guarantee |> Eshop.Conditions.update_guarantee(guarantee_params) 
		end  
	end

	def delete_guarantee(%{id: id}, _info) do 
		case {:ok, Eshop.Conditions.get_guarantee!(id)} do
			{:ok, guarantee} -> guarantee |> Eshop.Conditions.delete_guarantee() 
		end 
	end  
end
