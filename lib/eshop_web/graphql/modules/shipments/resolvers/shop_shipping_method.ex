defmodule EshopWeb.Schema.Resolvers.ShopShippingMethod do
  def list_shop_shipping_methods(_parent, _args, _resolution) do
    {:ok, Eshop.Shipments.list_shop_shipping_methods()}
  end

  def get_shop_shipping_method(_, %{id: id}, _) do
    {:ok, Eshop.Shipments.get_shop_shipping_method!(id)}
  end

  def create_shop_shipping_method(_parent, args, _resolution) do
    Eshop.Shipments.create_shop_shipping_method(args)
  end

  def update_shop_shipping_method(
        %{id: id, shop_shipping_method_params: shop_shipping_method_params},
        _info
      ) do
    case {:ok, Eshop.Shipments.get_shop_shipping_method!(id)} do
      {:ok, shop_shipping_method} ->
        shop_shipping_method
        |> Eshop.Shipments.update_shop_shipping_method(shop_shipping_method_params)
    end
  end

  def delete_shop_shipping_method(%{id: id}, _info) do
    case {:ok, Eshop.Shipments.get_shop_shipping_method!(id)} do
      {:ok, shop_shipping_method} ->
        shop_shipping_method |> Eshop.Shipments.delete_shop_shipping_method()
    end
  end
end
