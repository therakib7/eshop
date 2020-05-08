defmodule EshopWeb.Schema.Queries.UserSetting do 
  use Absinthe.Schema.Notation

  object :user_setting_queries do
    @desc "Get all user_settings"
    field :user_settings, list_of(:user_setting) do
      resolve &EshopWeb.Schema.Resolvers.UserSetting.list_user_settings/3
    end
  end 
end
