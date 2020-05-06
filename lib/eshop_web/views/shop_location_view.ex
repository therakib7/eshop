defmodule EshopWeb.ShopLocationView do
  use EshopWeb, :view
  alias EshopWeb.ShopLocationView

  def render("index.json", %{shop_locations: shop_locations}) do
    %{data: render_many(shop_locations, ShopLocationView, "shop_location.json")}
  end

  def render("show.json", %{shop_location: shop_location}) do
    %{data: render_one(shop_location, ShopLocationView, "shop_location.json")}
  end

  def render("shop_location.json", %{shop_location: shop_location}) do
    %{id: shop_location.id}
  end
end
