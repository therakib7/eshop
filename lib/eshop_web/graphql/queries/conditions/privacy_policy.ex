defmodule EshopWeb.Schema.Queries.PrivacyPolicy do 
  use Absinthe.Schema.Notation

  object :privacy_policy_queries do
    @desc "Get all privacy_policies"
    field :privacy_policies, list_of(:privacy_policy) do
      resolve &EshopWeb.Schema.Resolvers.PrivacyPolicy.list_privacy_policies/3
    end
  end 
end
