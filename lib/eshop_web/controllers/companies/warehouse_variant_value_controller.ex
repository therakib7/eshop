defmodule EshopWeb.WarehouseVariantValueController do
  use EshopWeb, :controller

  alias Eshop.Companies
  alias Eshop.Companies.WarehouseVariantValue

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    warehouse_variant_values = Companies.list_warehouse_variant_values()
    render(conn, "index.json", warehouse_variant_values: warehouse_variant_values)
  end

  def create(conn, %{"warehouse_variant_value" => warehouse_variant_value_params}) do
    with {:ok, %WarehouseVariantValue{} = warehouse_variant_value} <- Companies.create_warehouse_variant_value(warehouse_variant_value_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.warehouse_variant_value_path(conn, :show, warehouse_variant_value))
      |> render("show.json", warehouse_variant_value: warehouse_variant_value)
    end
  end

  def show(conn, %{"id" => id}) do
    warehouse_variant_value = Companies.get_warehouse_variant_value!(id)
    render(conn, "show.json", warehouse_variant_value: warehouse_variant_value)
  end

  def update(conn, %{"id" => id, "warehouse_variant_value" => warehouse_variant_value_params}) do
    warehouse_variant_value = Companies.get_warehouse_variant_value!(id)

    with {:ok, %WarehouseVariantValue{} = warehouse_variant_value} <- Companies.update_warehouse_variant_value(warehouse_variant_value, warehouse_variant_value_params) do
      render(conn, "show.json", warehouse_variant_value: warehouse_variant_value)
    end
  end

  def delete(conn, %{"id" => id}) do
    warehouse_variant_value = Companies.get_warehouse_variant_value!(id)

    with {:ok, %WarehouseVariantValue{}} <- Companies.delete_warehouse_variant_value(warehouse_variant_value) do
      send_resp(conn, :no_content, "")
    end
  end
end
