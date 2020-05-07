defmodule EshopWeb.WarehouseView do
  use EshopWeb, :view
  alias EshopWeb.WarehouseView

  def render("index.json", %{warehouses: warehouses}) do
    %{data: render_many(warehouses, WarehouseView, "warehouse.json")}
  end

  def render("show.json", %{warehouse: warehouse}) do
    %{data: render_one(warehouse, WarehouseView, "warehouse.json")}
  end

  def render("warehouse.json", %{warehouse: warehouse}) do
    %{id: warehouse.id,
      is_active: warehouse.is_active,
      name: warehouse.name,
      native_name: warehouse.native_name}
  end
end
