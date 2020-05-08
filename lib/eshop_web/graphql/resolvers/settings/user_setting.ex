defmodule EshopWeb.Schema.Resolvers.UserSetting do

	def list_user_settings(_parent, _args, _resolution) do
        {:ok, Eshop.Settings.list_user_settings()}
    end

    def create_user_setting(_parent, args, _resolution) do
        Eshop.Settings.create_user_setting(args)
    end

end
