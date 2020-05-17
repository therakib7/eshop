defmodule EshopWeb.RefundPolicyController do
  use EshopWeb, :controller

  alias Eshop.Conditions
  alias Eshop.Conditions.RefundPolicy

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    refund_policies = Conditions.list_refund_policies()
    render(conn, "index.json", refund_policies: refund_policies)
  end

  def create(conn, %{"refund_policy" => refund_policy_params}) do
    with {:ok, %RefundPolicy{} = refund_policy} <-
           Conditions.create_refund_policy(refund_policy_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.refund_policy_path(conn, :show, refund_policy))
      |> render("show.json", refund_policy: refund_policy)
    end
  end

  def show(conn, %{"id" => id}) do
    refund_policy = Conditions.get_refund_policy!(id)
    render(conn, "show.json", refund_policy: refund_policy)
  end

  def update(conn, %{"id" => id, "refund_policy" => refund_policy_params}) do
    refund_policy = Conditions.get_refund_policy!(id)

    with {:ok, %RefundPolicy{} = refund_policy} <-
           Conditions.update_refund_policy(refund_policy, refund_policy_params) do
      render(conn, "show.json", refund_policy: refund_policy)
    end
  end

  def delete(conn, %{"id" => id}) do
    refund_policy = Conditions.get_refund_policy!(id)

    with {:ok, %RefundPolicy{}} <- Conditions.delete_refund_policy(refund_policy) do
      send_resp(conn, :no_content, "")
    end
  end
end
