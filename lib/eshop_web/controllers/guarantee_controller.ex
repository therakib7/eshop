defmodule EshopWeb.GuaranteeController do
  use EshopWeb, :controller

  alias Eshop.Conditions
  alias Eshop.Conditions.Guarantee

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    guarantees = Conditions.list_guarantees()
    render(conn, "index.json", guarantees: guarantees)
  end

  def create(conn, %{"guarantee" => guarantee_params}) do
    with {:ok, %Guarantee{} = guarantee} <- Conditions.create_guarantee(guarantee_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.guarantee_path(conn, :show, guarantee))
      |> render("show.json", guarantee: guarantee)
    end
  end

  def show(conn, %{"id" => id}) do
    guarantee = Conditions.get_guarantee!(id)
    render(conn, "show.json", guarantee: guarantee)
  end

  def update(conn, %{"id" => id, "guarantee" => guarantee_params}) do
    guarantee = Conditions.get_guarantee!(id)

    with {:ok, %Guarantee{} = guarantee} <- Conditions.update_guarantee(guarantee, guarantee_params) do
      render(conn, "show.json", guarantee: guarantee)
    end
  end

  def delete(conn, %{"id" => id}) do
    guarantee = Conditions.get_guarantee!(id)

    with {:ok, %Guarantee{}} <- Conditions.delete_guarantee(guarantee) do
      send_resp(conn, :no_content, "")
    end
  end
end
