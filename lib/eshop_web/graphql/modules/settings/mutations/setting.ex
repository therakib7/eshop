defmodule EshopWeb.Schema.Mutations.Setting do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Setting, as: Setting

  object :setting_mutations do
    @desc "Create a setting"
    field :create_setting, type: :setting do
      arg(:id, :integer)
      arg(:key, :string)
      arg(:value, :string)

      resolve(&Setting.create_setting/3)
    end

    @desc "Update a setting"
    field :update_setting, type: :setting do
      arg(:id, non_null(:id))
      arg(:setting_params, :setting_params)

      resolve(&Setting.update_setting/2)
    end

    @desc "Delete a setting"
    field :delete_setting, type: :setting do
      arg(:id, non_null(:id))
      resolve(&Setting.delete_setting/2)
    end
  end
end
