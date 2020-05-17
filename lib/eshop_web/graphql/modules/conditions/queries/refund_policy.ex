defmodule EshopWeb.Schema.Queries.RefundPolicy do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.RefundPolicy, as: RefundPolicy

  object :refund_policy_queries do
    @desc "Get all refund_policies"
    field :refund_policies, list_of(:refund_policy) do
      resolve(&RefundPolicy.list_refund_policies/3)
    end

    @desc "Get a refund_policy by its id"
    field :refund_policy, :refund_policy do
      arg(:id, non_null(:id))
      resolve(&RefundPolicy.get_refund_policy/3)
    end
  end
end
