defmodule EshopWeb.BrandController do
  use EshopWeb, :controller

  alias Eshop.Components
  alias Eshop.Components.Brand

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    brands = Components.list_brands()
    render(conn, "index.json", brands: brands)
  end

  def create(conn, %{"brand" => brand_params}) do
    with {:ok, %Brand{} = brand} <- Components.create_brand(brand_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.brand_path(conn, :show, brand))
      |> render("show.json", brand: brand)
    end
  end

  def show(conn, %{"id" => id}) do
    brand = Components.get_brand!(id)
    render(conn, "show.json", brand: brand)
  end

  def update(conn, %{"id" => id, "brand" => brand_params}) do
    brand = Components.get_brand!(id)

    with {:ok, %Brand{} = brand} <- Components.update_brand(brand, brand_params) do
      render(conn, "show.json", brand: brand)
    end
  end

  def delete(conn, %{"id" => id}) do
    brand = Components.get_brand!(id)

    with {:ok, %Brand{}} <- Components.delete_brand(brand) do
      send_resp(conn, :no_content, "")
    end
  end
end
