defmodule EshopWeb.Schema.Queries.Setting do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Setting, as: Setting

  object :setting_queries do
    @desc "Get all settings"
    field :settings, list_of(:setting) do
      resolve &Setting.list_settings/3
    end

    @desc "Get a setting by its id"
    field :setting, :setting do
      arg :id, non_null(:id)
      resolve &Setting.get_setting/3
    end 
  end
end