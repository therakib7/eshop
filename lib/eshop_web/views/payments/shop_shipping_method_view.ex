defmodule EshopWeb.ShopShippingMethodView do
  use EshopWeb, :view
  alias EshopWeb.ShopShippingMethodView

  def render("index.json", %{shop_shipping_methods: shop_shipping_methods}) do
    %{
      data:
        render_many(shop_shipping_methods, ShopShippingMethodView, "shop_shipping_method.json")
    }
  end

  def render("show.json", %{shop_shipping_method: shop_shipping_method}) do
    %{data: render_one(shop_shipping_method, ShopShippingMethodView, "shop_shipping_method.json")}
  end

  def render("shop_shipping_method.json", %{shop_shipping_method: shop_shipping_method}) do
    %{id: shop_shipping_method.id}
  end
end
