defmodule EshopWeb.ShippingAddressView do
  use EshopWeb, :view
  alias EshopWeb.ShippingAddressView

  def render("index.json", %{shipping_addresses: shipping_addresses}) do
    %{data: render_many(shipping_addresses, ShippingAddressView, "shipping_address.json")}
  end

  def render("show.json", %{shipping_address: shipping_address}) do
    %{data: render_one(shipping_address, ShippingAddressView, "shipping_address.json")}
  end

  def render("shipping_address.json", %{shipping_address: shipping_address}) do
    %{
      id: shipping_address.id,
      lat: shipping_address.lat,
      long: shipping_address.long,
      address: shipping_address.address
    }
  end
end
