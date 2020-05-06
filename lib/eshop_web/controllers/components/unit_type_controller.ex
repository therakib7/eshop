defmodule EshopWeb.UnitTypeController do
  use EshopWeb, :controller

  alias Eshop.Components
  alias Eshop.Components.UnitType

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    unit_types = Components.list_unit_types()
    render(conn, "index.json", unit_types: unit_types)
  end

  def create(conn, %{"unit_type" => unit_type_params}) do
    with {:ok, %UnitType{} = unit_type} <- Components.create_unit_type(unit_type_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.unit_type_path(conn, :show, unit_type))
      |> render("show.json", unit_type: unit_type)
    end
  end

  def show(conn, %{"id" => id}) do
    unit_type = Components.get_unit_type!(id)
    render(conn, "show.json", unit_type: unit_type)
  end

  def update(conn, %{"id" => id, "unit_type" => unit_type_params}) do
    unit_type = Components.get_unit_type!(id)

    with {:ok, %UnitType{} = unit_type} <- Components.update_unit_type(unit_type, unit_type_params) do
      render(conn, "show.json", unit_type: unit_type)
    end
  end

  def delete(conn, %{"id" => id}) do
    unit_type = Components.get_unit_type!(id)

    with {:ok, %UnitType{}} <- Components.delete_unit_type(unit_type) do
      send_resp(conn, :no_content, "")
    end
  end
end
