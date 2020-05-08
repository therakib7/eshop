defmodule EshopWeb.Schema.Resolvers.CompanySetting do

	def list_company_settings(_parent, _args, _resolution) do
        {:ok, Eshop.Settings.list_company_settings()}
    end

    def create_company_setting(_parent, args, _resolution) do
        Eshop.Settings.create_company_setting(args)
    end

end
