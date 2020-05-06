defmodule EshopWeb.BankingProviderController do
  use EshopWeb, :controller

  alias Eshop.Payments
  alias Eshop.Payments.BankingProvider

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    banking_providers = Payments.list_banking_providers()
    render(conn, "index.json", banking_providers: banking_providers)
  end

  def create(conn, %{"banking_provider" => banking_provider_params}) do
    with {:ok, %BankingProvider{} = banking_provider} <- Payments.create_banking_provider(banking_provider_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.banking_provider_path(conn, :show, banking_provider))
      |> render("show.json", banking_provider: banking_provider)
    end
  end

  def show(conn, %{"id" => id}) do
    banking_provider = Payments.get_banking_provider!(id)
    render(conn, "show.json", banking_provider: banking_provider)
  end

  def update(conn, %{"id" => id, "banking_provider" => banking_provider_params}) do
    banking_provider = Payments.get_banking_provider!(id)

    with {:ok, %BankingProvider{} = banking_provider} <- Payments.update_banking_provider(banking_provider, banking_provider_params) do
      render(conn, "show.json", banking_provider: banking_provider)
    end
  end

  def delete(conn, %{"id" => id}) do
    banking_provider = Payments.get_banking_provider!(id)

    with {:ok, %BankingProvider{}} <- Payments.delete_banking_provider(banking_provider) do
      send_resp(conn, :no_content, "")
    end
  end
end
