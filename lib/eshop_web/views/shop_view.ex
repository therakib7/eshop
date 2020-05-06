defmodule EshopWeb.ShopView do
  use EshopWeb, :view
  alias EshopWeb.ShopView

  def render("index.json", %{shops: shops}) do
    %{data: render_many(shops, ShopView, "shop.json")}
  end

  def render("show.json", %{shop: shop}) do
    %{data: render_one(shop, ShopView, "shop.json")}
  end

  def render("shop.json", %{shop: shop}) do
    %{id: shop.id,
      is_active: shop.is_active,
      is_verifed: shop.is_verifed,
      name: shop.name,
      native_name: shop.native_name,
      trade_assurance: shop.trade_assurance,
      highest_assurance: shop.highest_assurance,
      golden_supplier: shop.golden_supplier,
      created_at: shop.created_at}
  end
end
