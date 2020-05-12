defmodule EshopWeb.TypeStatusController do
  use EshopWeb, :controller

  alias Eshop.Components
  alias Eshop.Components.TypeStatus

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    type_statuses = Components.list_type_statuses()
    render(conn, "index.json", type_statuses: type_statuses)
  end

  def create(conn, %{"type_status" => type_status_params}) do
    with {:ok, %TypeStatus{} = type_status} <- Components.create_type_status(type_status_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.type_status_path(conn, :show, type_status))
      |> render("show.json", type_status: type_status)
    end
  end

  def show(conn, %{"id" => id}) do
    type_status = Components.get_type_status!(id)
    render(conn, "show.json", type_status: type_status)
  end

  def update(conn, %{"id" => id, "type_status" => type_status_params}) do
    type_status = Components.get_type_status!(id)

    with {:ok, %TypeStatus{} = type_status} <- Components.update_type_status(type_status, type_status_params) do
      render(conn, "show.json", type_status: type_status)
    end
  end

  def delete(conn, %{"id" => id}) do
    type_status = Components.get_type_status!(id)

    with {:ok, %TypeStatus{}} <- Components.delete_type_status(type_status) do
      send_resp(conn, :no_content, "")
    end
  end
end
