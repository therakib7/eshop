defmodule EshopWeb.Schema.Queries.CompanySetting do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.CompanySetting, as: CompanySetting

  object :company_setting_queries do
    @desc "Get all company_settings"
    field :company_settings, list_of(:company_setting) do
      resolve(&CompanySetting.list_company_settings/3)
    end

    @desc "Get a company_setting by its id"
    field :company_setting, :company_setting do
      arg(:id, non_null(:id))
      resolve(&CompanySetting.get_company_setting/3)
    end
  end
end
