defmodule EshopWeb.ShopLocationController do
  use EshopWeb, :controller

  alias Eshop.Geo
  alias Eshop.Geo.ShopLocation

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    shop_locations = Geo.list_shop_locations()
    render(conn, "index.json", shop_locations: shop_locations)
  end

  def create(conn, %{"shop_location" => shop_location_params}) do
    with {:ok, %ShopLocation{} = shop_location} <- Geo.create_shop_location(shop_location_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.shop_location_path(conn, :show, shop_location))
      |> render("show.json", shop_location: shop_location)
    end
  end

  def show(conn, %{"id" => id}) do
    shop_location = Geo.get_shop_location!(id)
    render(conn, "show.json", shop_location: shop_location)
  end

  def update(conn, %{"id" => id, "shop_location" => shop_location_params}) do
    shop_location = Geo.get_shop_location!(id)

    with {:ok, %ShopLocation{} = shop_location} <- Geo.update_shop_location(shop_location, shop_location_params) do
      render(conn, "show.json", shop_location: shop_location)
    end
  end

  def delete(conn, %{"id" => id}) do
    shop_location = Geo.get_shop_location!(id)

    with {:ok, %ShopLocation{}} <- Geo.delete_shop_location(shop_location) do
      send_resp(conn, :no_content, "")
    end
  end
end
