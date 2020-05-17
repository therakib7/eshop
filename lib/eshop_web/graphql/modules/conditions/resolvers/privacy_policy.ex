defmodule EshopWeb.Schema.Resolvers.PrivacyPolicy do
  def list_privacy_policies(_parent, _args, _resolution) do
    {:ok, Eshop.Conditions.list_privacy_policies()}
  end

  def get_privacy_policy(_, %{id: id}, _) do
    {:ok, Eshop.Conditions.get_privacy_policy!(id)}
  end

  def create_privacy_policy(_parent, args, _resolution) do
    Eshop.Conditions.create_privacy_policy(args)
  end

  def update_privacy_policy(%{id: id, privacy_policy_params: privacy_policy_params}, _info) do
    case {:ok, Eshop.Conditions.get_privacy_policy!(id)} do
      {:ok, privacy_policy} ->
        privacy_policy |> Eshop.Conditions.update_privacy_policy(privacy_policy_params)
    end
  end

  def delete_privacy_policy(%{id: id}, _info) do
    case {:ok, Eshop.Conditions.get_privacy_policy!(id)} do
      {:ok, privacy_policy} -> privacy_policy |> Eshop.Conditions.delete_privacy_policy()
    end
  end
end
