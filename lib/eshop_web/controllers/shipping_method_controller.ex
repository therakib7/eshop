defmodule EshopWeb.ShippingMethodController do
  use EshopWeb, :controller

  alias Eshop.Shipments
  alias Eshop.Shipments.ShippingMethod

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    shipping_methods = Shipments.list_shipping_methods()
    render(conn, "index.json", shipping_methods: shipping_methods)
  end

  def create(conn, %{"shipping_method" => shipping_method_params}) do
    with {:ok, %ShippingMethod{} = shipping_method} <- Shipments.create_shipping_method(shipping_method_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.shipping_method_path(conn, :show, shipping_method))
      |> render("show.json", shipping_method: shipping_method)
    end
  end

  def show(conn, %{"id" => id}) do
    shipping_method = Shipments.get_shipping_method!(id)
    render(conn, "show.json", shipping_method: shipping_method)
  end

  def update(conn, %{"id" => id, "shipping_method" => shipping_method_params}) do
    shipping_method = Shipments.get_shipping_method!(id)

    with {:ok, %ShippingMethod{} = shipping_method} <- Shipments.update_shipping_method(shipping_method, shipping_method_params) do
      render(conn, "show.json", shipping_method: shipping_method)
    end
  end

  def delete(conn, %{"id" => id}) do
    shipping_method = Shipments.get_shipping_method!(id)

    with {:ok, %ShippingMethod{}} <- Shipments.delete_shipping_method(shipping_method) do
      send_resp(conn, :no_content, "")
    end
  end
end
