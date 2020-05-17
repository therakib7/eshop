defmodule EshopWeb.Schema.Queries.UserSetting do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.UserSetting, as: UserSetting

  object :user_setting_queries do
    @desc "Get all user_settings"
    field :user_settings, list_of(:user_setting) do
      resolve(&UserSetting.list_user_settings/3)
    end

    @desc "Get a user_setting by its id"
    field :user_setting, :user_setting do
      arg(:id, non_null(:id))
      resolve(&UserSetting.get_user_setting/3)
    end
  end
end
