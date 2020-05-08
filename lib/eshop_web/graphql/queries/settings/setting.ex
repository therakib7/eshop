defmodule EshopWeb.Schema.Queries.Setting do 
  use Absinthe.Schema.Notation

  object :setting_queries do
    @desc "Get all settings"
    field :settings, list_of(:setting) do
      resolve &EshopWeb.Schema.Resolvers.Setting.list_settings/3
    end
  end 
end
