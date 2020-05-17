defmodule EshopWeb.Schema.Mutations.UserSetting do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.UserSetting, as: UserSetting

  object :user_setting_mutations do
    @desc "Create a user_setting"
    field :create_user_setting, type: :user_setting do
      arg(:id, :integer)
      arg(:key, :string)
      arg(:value, :string)
      arg(:user_id, :id)

      resolve(&UserSetting.create_user_setting/3)
    end

    @desc "Update a user_setting"
    field :update_user_setting, type: :user_setting do
      arg(:id, non_null(:id))
      arg(:user_setting_params, :user_setting_params)

      resolve(&UserSetting.update_user_setting/2)
    end

    @desc "Delete a user_setting"
    field :delete_user_setting, type: :user_setting do
      arg(:id, non_null(:id))
      resolve(&UserSetting.delete_user_setting/2)
    end
  end
end
