defmodule EshopWeb.Schema.Resolvers.RefundPolicy do
  def list_refund_policies(_parent, _args, _resolution) do
    {:ok, Eshop.Conditions.list_refund_policies()}
  end

  def get_refund_policy(_, %{id: id}, _) do
    {:ok, Eshop.Conditions.get_refund_policy!(id)}
  end

  def create_refund_policy(_parent, args, _resolution) do
    Eshop.Conditions.create_refund_policy(args)
  end

  def update_refund_policy(%{id: id, refund_policy_params: refund_policy_params}, _info) do
    case {:ok, Eshop.Conditions.get_refund_policy!(id)} do
      {:ok, refund_policy} ->
        refund_policy |> Eshop.Conditions.update_refund_policy(refund_policy_params)
    end
  end

  def delete_refund_policy(%{id: id}, _info) do
    case {:ok, Eshop.Conditions.get_refund_policy!(id)} do
      {:ok, refund_policy} -> refund_policy |> Eshop.Conditions.delete_refund_policy()
    end
  end
end
