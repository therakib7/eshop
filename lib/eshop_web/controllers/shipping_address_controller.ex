defmodule EshopWeb.ShippingAddressController do
  use EshopWeb, :controller

  alias Eshop.Shipments
  alias Eshop.Shipments.ShippingAddress

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    shipping_addresses = Shipments.list_shipping_addresses()
    render(conn, "index.json", shipping_addresses: shipping_addresses)
  end

  def create(conn, %{"shipping_address" => shipping_address_params}) do
    with {:ok, %ShippingAddress{} = shipping_address} <- Shipments.create_shipping_address(shipping_address_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.shipping_address_path(conn, :show, shipping_address))
      |> render("show.json", shipping_address: shipping_address)
    end
  end

  def show(conn, %{"id" => id}) do
    shipping_address = Shipments.get_shipping_address!(id)
    render(conn, "show.json", shipping_address: shipping_address)
  end

  def update(conn, %{"id" => id, "shipping_address" => shipping_address_params}) do
    shipping_address = Shipments.get_shipping_address!(id)

    with {:ok, %ShippingAddress{} = shipping_address} <- Shipments.update_shipping_address(shipping_address, shipping_address_params) do
      render(conn, "show.json", shipping_address: shipping_address)
    end
  end

  def delete(conn, %{"id" => id}) do
    shipping_address = Shipments.get_shipping_address!(id)

    with {:ok, %ShippingAddress{}} <- Shipments.delete_shipping_address(shipping_address) do
      send_resp(conn, :no_content, "")
    end
  end
end
