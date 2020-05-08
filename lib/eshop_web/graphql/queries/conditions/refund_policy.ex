defmodule EshopWeb.Schema.Queries.RefundPolicy do 
  use Absinthe.Schema.Notation

  object :refund_policy_queries do
    @desc "Get all refund_policies"
    field :refund_policies, list_of(:refund_policy) do
      resolve &EshopWeb.Schema.Resolvers.RefundPolicy.list_refund_policies/3
    end
  end 
end
