defmodule EshopWeb.ItemWarehouseVariantController do
  use EshopWeb, :controller

  alias Eshop.Components
  alias Eshop.Components.ItemWarehouseVariant

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    item_warehouse_variants = Components.list_item_warehouse_variants()
    render(conn, "index.json", item_warehouse_variants: item_warehouse_variants)
  end

  def create(conn, %{"item_warehouse_variant" => item_warehouse_variant_params}) do
    with {:ok, %ItemWarehouseVariant{} = item_warehouse_variant} <-
           Components.create_item_warehouse_variant(item_warehouse_variant_params) do
      conn
      |> put_status(:created)
      |> put_resp_header(
        "location",
        Routes.item_warehouse_variant_path(conn, :show, item_warehouse_variant)
      )
      |> render("show.json", item_warehouse_variant: item_warehouse_variant)
    end
  end

  def show(conn, %{"id" => id}) do
    item_warehouse_variant = Components.get_item_warehouse_variant!(id)
    render(conn, "show.json", item_warehouse_variant: item_warehouse_variant)
  end

  def update(conn, %{"id" => id, "item_warehouse_variant" => item_warehouse_variant_params}) do
    item_warehouse_variant = Components.get_item_warehouse_variant!(id)

    with {:ok, %ItemWarehouseVariant{} = item_warehouse_variant} <-
           Components.update_item_warehouse_variant(
             item_warehouse_variant,
             item_warehouse_variant_params
           ) do
      render(conn, "show.json", item_warehouse_variant: item_warehouse_variant)
    end
  end

  def delete(conn, %{"id" => id}) do
    item_warehouse_variant = Components.get_item_warehouse_variant!(id)

    with {:ok, %ItemWarehouseVariant{}} <-
           Components.delete_item_warehouse_variant(item_warehouse_variant) do
      send_resp(conn, :no_content, "")
    end
  end
end
