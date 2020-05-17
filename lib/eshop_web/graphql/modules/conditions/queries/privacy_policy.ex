defmodule EshopWeb.Schema.Queries.PrivacyPolicy do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.PrivacyPolicy, as: PrivacyPolicy

  object :privacy_policy_queries do
    @desc "Get all privacy_policies"
    field :privacy_policies, list_of(:privacy_policy) do
      resolve(&PrivacyPolicy.list_privacy_policies/3)
    end

    @desc "Get a privacy_policy by its id"
    field :privacy_policy, :privacy_policy do
      arg(:id, non_null(:id))
      resolve(&PrivacyPolicy.get_privacy_policy/3)
    end
  end
end
