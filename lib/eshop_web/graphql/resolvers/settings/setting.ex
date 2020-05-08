defmodule EshopWeb.Schema.Resolvers.Setting do

	def list_user_settings(_parent, _args, _resolution) do
        {:ok, Eshop.Settings.list_user_settings()}
    end

end
