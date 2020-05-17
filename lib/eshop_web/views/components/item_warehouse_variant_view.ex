defmodule EshopWeb.ItemWarehouseVariantView do
  use EshopWeb, :view
  alias EshopWeb.ItemWarehouseVariantView

  def render("index.json", %{item_warehouse_variants: item_warehouse_variants}) do
    %{
      data:
        render_many(
          item_warehouse_variants,
          ItemWarehouseVariantView,
          "item_warehouse_variant.json"
        )
    }
  end

  def render("show.json", %{item_warehouse_variant: item_warehouse_variant}) do
    %{
      data:
        render_one(
          item_warehouse_variant,
          ItemWarehouseVariantView,
          "item_warehouse_variant.json"
        )
    }
  end

  def render("item_warehouse_variant.json", %{item_warehouse_variant: item_warehouse_variant}) do
    %{id: item_warehouse_variant.id}
  end
end
