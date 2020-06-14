defmodule EshopWeb.Schema.Mutations.PrivacyPolicy do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.PrivacyPolicy, as: PrivacyPolicy

  object :privacy_policy_mutations do
    @desc "Create a privacy_policy"
    field :create_privacy_policy, type: :privacy_policy do
      arg(:id, :integer)
      arg(:content, :string)
      arg(:native_content, :string)
      arg(:shop_id, :integer)

      resolve(&PrivacyPolicy.create_privacy_policy/3)
    end

    @desc "Update a privacy_policy"
    field :update_privacy_policy, type: :privacy_policy do
      arg(:id, non_null(:id))
      arg(:privacy_policy_params, :privacy_policy_params)

      resolve(&PrivacyPolicy.update_privacy_policy/2)
    end

    @desc "Delete a privacy_policy"
    field :delete_privacy_policy, type: :privacy_policy do
      arg(:id, non_null(:id))
      resolve(&PrivacyPolicy.delete_privacy_policy/2)
    end
  end
end
