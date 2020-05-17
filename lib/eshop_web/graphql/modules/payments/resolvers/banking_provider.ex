defmodule EshopWeb.Schema.Resolvers.BankingProvider do
  def list_banking_providers(_parent, _args, _resolution) do
    {:ok, Eshop.Payments.list_banking_providers()}
  end

  def get_banking_provider(_, %{id: id}, _) do
    {:ok, Eshop.Payments.get_banking_provider!(id)}
  end

  def create_banking_provider(_parent, args, _resolution) do
    Eshop.Payments.create_banking_provider(args)
  end

  def update_banking_provider(%{id: id, banking_provider_params: banking_provider_params}, _info) do
    case {:ok, Eshop.Payments.get_banking_provider!(id)} do
      {:ok, banking_provider} ->
        banking_provider |> Eshop.Payments.update_banking_provider(banking_provider_params)
    end
  end

  def delete_banking_provider(%{id: id}, _info) do
    case {:ok, Eshop.Payments.get_banking_provider!(id)} do
      {:ok, banking_provider} -> banking_provider |> Eshop.Payments.delete_banking_provider()
    end
  end
end
