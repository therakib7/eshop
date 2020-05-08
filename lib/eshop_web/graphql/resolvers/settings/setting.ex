defmodule EshopWeb.Schema.Resolvers.Setting do

	def list_user_settings(_parent, _args, _resolution) do
        {:ok, Eshop.Settings.list_user_settings()}
    end

    def create_setting(_parent, args, _resolution) do
        Eshop.Settings.create_setting(args)
    end

end
