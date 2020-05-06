defmodule EshopWeb.WarehouseVariantController do
  use EshopWeb, :controller

  alias Eshop.Companies
  alias Eshop.Companies.WarehouseVariant

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    warehouse_variants = Companies.list_warehouse_variants()
    render(conn, "index.json", warehouse_variants: warehouse_variants)
  end

  def create(conn, %{"warehouse_variant" => warehouse_variant_params}) do
    with {:ok, %WarehouseVariant{} = warehouse_variant} <- Companies.create_warehouse_variant(warehouse_variant_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.warehouse_variant_path(conn, :show, warehouse_variant))
      |> render("show.json", warehouse_variant: warehouse_variant)
    end
  end

  def show(conn, %{"id" => id}) do
    warehouse_variant = Companies.get_warehouse_variant!(id)
    render(conn, "show.json", warehouse_variant: warehouse_variant)
  end

  def update(conn, %{"id" => id, "warehouse_variant" => warehouse_variant_params}) do
    warehouse_variant = Companies.get_warehouse_variant!(id)

    with {:ok, %WarehouseVariant{} = warehouse_variant} <- Companies.update_warehouse_variant(warehouse_variant, warehouse_variant_params) do
      render(conn, "show.json", warehouse_variant: warehouse_variant)
    end
  end

  def delete(conn, %{"id" => id}) do
    warehouse_variant = Companies.get_warehouse_variant!(id)

    with {:ok, %WarehouseVariant{}} <- Companies.delete_warehouse_variant(warehouse_variant) do
      send_resp(conn, :no_content, "")
    end
  end
end
