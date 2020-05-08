defmodule EshopWeb.Schema.Queries.CompanySetting do 
  use Absinthe.Schema.Notation

  object :company_setting_queries do
    @desc "Get all company_settings"
    field :company_settings, list_of(:company_setting) do
      resolve &EshopWeb.Schema.Resolvers.CompanySetting.list_company_settings/3
    end
  end 
end
