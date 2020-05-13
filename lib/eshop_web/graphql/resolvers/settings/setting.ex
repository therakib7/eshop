defmodule EshopWeb.Schema.Resolvers.Company do
	 
   	def list_settings(_parent, _args, _resolution) do
        {:ok, Eshop.Settings.list_settings()}
    end

    def get_setting(_, %{id: id}, _) do
		{:ok, Eshop.Settings.get_setting!(id)} 
	end 
	 
    def create_setting(_parent, args, _resolution) do
        Eshop.Settings.create_setting(args)
    end 

    def update_setting(%{id: id, setting_params: setting_params}, _info) do
		case {:ok, Eshop.Settings.get_setting!(id)} do
			{:ok, setting} -> setting |> Eshop.Settings.update_setting(setting_params) 
		end  
	end

	def delete_setting(%{id: id}, _info) do 
		case {:ok, Eshop.Settings.get_setting!(id)} do
			{:ok, setting} -> setting |> Eshop.Settings.delete_setting() 
		end 
	end  
end