defmodule EshopWeb.Schema.Resolvers.ShippingAddress do
  def list_shipping_addresses(_parent, _args, _resolution) do
    {:ok, Eshop.Shipments.list_shipping_addresses()}
  end

  def get_shipping_address(_, %{id: id}, _) do
    {:ok, Eshop.Shipments.get_shipping_address!(id)}
  end

  def create_shipping_address(_parent, args, _resolution) do
    Eshop.Shipments.create_shipping_address(args)
  end

  def update_shipping_address(%{id: id, shipping_address_params: shipping_address_params}, _info) do
    case {:ok, Eshop.Shipments.get_shipping_address!(id)} do
      {:ok, shipping_address} ->
        shipping_address |> Eshop.Shipments.update_shipping_address(shipping_address_params)
    end
  end

  def delete_shipping_address(%{id: id}, _info) do
    case {:ok, Eshop.Shipments.get_shipping_address!(id)} do
      {:ok, shipping_address} -> shipping_address |> Eshop.Shipments.delete_shipping_address()
    end
  end
end
