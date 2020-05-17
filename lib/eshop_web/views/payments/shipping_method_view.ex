defmodule EshopWeb.ShippingMethodView do
  use EshopWeb, :view
  alias EshopWeb.ShippingMethodView

  def render("index.json", %{shipping_methods: shipping_methods}) do
    %{data: render_many(shipping_methods, ShippingMethodView, "shipping_method.json")}
  end

  def render("show.json", %{shipping_method: shipping_method}) do
    %{data: render_one(shipping_method, ShippingMethodView, "shipping_method.json")}
  end

  def render("shipping_method.json", %{shipping_method: shipping_method}) do
    %{
      id: shipping_method.id,
      is_active: shipping_method.is_active,
      name: shipping_method.name,
      native_name: shipping_method.native_name
    }
  end
end
