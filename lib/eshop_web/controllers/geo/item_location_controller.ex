defmodule EshopWeb.ItemLocationController do
  use EshopWeb, :controller

  alias Eshop.Geo
  alias Eshop.Geo.ItemLocation

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    item_locations = Geo.list_item_locations()
    render(conn, "index.json", item_locations: item_locations)
  end

  def create(conn, %{"item_location" => item_location_params}) do
    with {:ok, %ItemLocation{} = item_location} <- Geo.create_item_location(item_location_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.item_location_path(conn, :show, item_location))
      |> render("show.json", item_location: item_location)
    end
  end

  def show(conn, %{"id" => id}) do
    item_location = Geo.get_item_location!(id)
    render(conn, "show.json", item_location: item_location)
  end

  def update(conn, %{"id" => id, "item_location" => item_location_params}) do
    item_location = Geo.get_item_location!(id)

    with {:ok, %ItemLocation{} = item_location} <-
           Geo.update_item_location(item_location, item_location_params) do
      render(conn, "show.json", item_location: item_location)
    end
  end

  def delete(conn, %{"id" => id}) do
    item_location = Geo.get_item_location!(id)

    with {:ok, %ItemLocation{}} <- Geo.delete_item_location(item_location) do
      send_resp(conn, :no_content, "")
    end
  end
end
