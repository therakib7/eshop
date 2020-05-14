defmodule EshopWeb.Schema.Resolvers.CountryStage do
	 
   	def list_country_stages(_parent, _args, _resolution) do
        {:ok, Eshop.Geo.list_country_stages()}
    end

    def get_country_stage(_, %{id: id}, _) do
		{:ok, Eshop.Geo.get_country_stage!(id)} 
	end 
	 
    def create_country_stage(_parent, args, _resolution) do
        Eshop.Geo.create_country_stage(args)
    end 

    def update_country_stage(%{id: id, country_stage_params: country_stage_params}, _info) do
		case {:ok, Eshop.Geo.get_country_stage!(id)} do
			{:ok, country_stage} -> country_stage |> Eshop.Geo.update_country_stage(country_stage_params) 
		end  
	end

	def delete_country_stage(%{id: id}, _info) do 
		case {:ok, Eshop.Geo.get_country_stage!(id)} do
			{:ok, country_stage} -> country_stage |> Eshop.Geo.delete_country_stage() 
		end 
	end  
end
