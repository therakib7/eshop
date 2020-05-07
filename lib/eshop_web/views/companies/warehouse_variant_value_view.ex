defmodule EshopWeb.WarehouseVariantValueView do
  use EshopWeb, :view
  alias EshopWeb.WarehouseVariantValueView

  def render("index.json", %{warehouse_variant_values: warehouse_variant_values}) do
    %{data: render_many(warehouse_variant_values, WarehouseVariantValueView, "warehouse_variant_value.json")}
  end

  def render("show.json", %{warehouse_variant_value: warehouse_variant_value}) do
    %{data: render_one(warehouse_variant_value, WarehouseVariantValueView, "warehouse_variant_value.json")}
  end

  def render("warehouse_variant_value.json", %{warehouse_variant_value: warehouse_variant_value}) do
    %{id: warehouse_variant_value.id,
      value: warehouse_variant_value.value,
      native_value: warehouse_variant_value.native_value}
  end
end
