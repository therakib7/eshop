defmodule EshopWeb.Schema.Resolvers.CompanySetting do

	def list_company_settings(_parent, _args, _resolution) do
        {:ok, Eshop.Settings.list_company_settings()}
    end

end
