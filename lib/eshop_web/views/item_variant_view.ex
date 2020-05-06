defmodule EshopWeb.ItemVariantView do
  use EshopWeb, :view
  alias EshopWeb.ItemVariantView

  def render("index.json", %{item_variants: item_variants}) do
    %{data: render_many(item_variants, ItemVariantView, "item_variant.json")}
  end

  def render("show.json", %{item_variant: item_variant}) do
    %{data: render_one(item_variant, ItemVariantView, "item_variant.json")}
  end

  def render("item_variant.json", %{item_variant: item_variant}) do
    %{id: item_variant.id,
      unit_price: item_variant.unit_price,
      cost_price: item_variant.cost_price,
      sale_price: item_variant.sale_price}
  end
end
