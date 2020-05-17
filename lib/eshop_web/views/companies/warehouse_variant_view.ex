defmodule EshopWeb.WarehouseVariantView do
  use EshopWeb, :view
  alias EshopWeb.WarehouseVariantView

  def render("index.json", %{warehouse_variants: warehouse_variants}) do
    %{data: render_many(warehouse_variants, WarehouseVariantView, "warehouse_variant.json")}
  end

  def render("show.json", %{warehouse_variant: warehouse_variant}) do
    %{data: render_one(warehouse_variant, WarehouseVariantView, "warehouse_variant.json")}
  end

  def render("warehouse_variant.json", %{warehouse_variant: warehouse_variant}) do
    %{
      id: warehouse_variant.id,
      type: warehouse_variant.type,
      name: warehouse_variant.name,
      native_name: warehouse_variant.native_name
    }
  end
end
