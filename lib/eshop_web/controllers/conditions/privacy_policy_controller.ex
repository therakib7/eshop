defmodule EshopWeb.PrivacyPolicyController do
  use EshopWeb, :controller

  alias Eshop.Conditions
  alias Eshop.Conditions.PrivacyPolicy

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    privacy_policies = Conditions.list_privacy_policies()
    render(conn, "index.json", privacy_policies: privacy_policies)
  end

  def create(conn, %{"privacy_policy" => privacy_policy_params}) do
    with {:ok, %PrivacyPolicy{} = privacy_policy} <-
           Conditions.create_privacy_policy(privacy_policy_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.privacy_policy_path(conn, :show, privacy_policy))
      |> render("show.json", privacy_policy: privacy_policy)
    end
  end

  def show(conn, %{"id" => id}) do
    privacy_policy = Conditions.get_privacy_policy!(id)
    render(conn, "show.json", privacy_policy: privacy_policy)
  end

  def update(conn, %{"id" => id, "privacy_policy" => privacy_policy_params}) do
    privacy_policy = Conditions.get_privacy_policy!(id)

    with {:ok, %PrivacyPolicy{} = privacy_policy} <-
           Conditions.update_privacy_policy(privacy_policy, privacy_policy_params) do
      render(conn, "show.json", privacy_policy: privacy_policy)
    end
  end

  def delete(conn, %{"id" => id}) do
    privacy_policy = Conditions.get_privacy_policy!(id)

    with {:ok, %PrivacyPolicy{}} <- Conditions.delete_privacy_policy(privacy_policy) do
      send_resp(conn, :no_content, "")
    end
  end
end
