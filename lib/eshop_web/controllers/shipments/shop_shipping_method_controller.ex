defmodule EshopWeb.ShopShippingMethodController do
  use EshopWeb, :controller

  alias Eshop.Shipments
  alias Eshop.Shipments.ShopShippingMethod

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    shop_shipping_methods = Shipments.list_shop_shipping_methods()
    render(conn, "index.json", shop_shipping_methods: shop_shipping_methods)
  end

  def create(conn, %{"shop_shipping_method" => shop_shipping_method_params}) do
    with {:ok, %ShopShippingMethod{} = shop_shipping_method} <-
           Shipments.create_shop_shipping_method(shop_shipping_method_params) do
      conn
      |> put_status(:created)
      |> put_resp_header(
        "location",
        Routes.shop_shipping_method_path(conn, :show, shop_shipping_method)
      )
      |> render("show.json", shop_shipping_method: shop_shipping_method)
    end
  end

  def show(conn, %{"id" => id}) do
    shop_shipping_method = Shipments.get_shop_shipping_method!(id)
    render(conn, "show.json", shop_shipping_method: shop_shipping_method)
  end

  def update(conn, %{"id" => id, "shop_shipping_method" => shop_shipping_method_params}) do
    shop_shipping_method = Shipments.get_shop_shipping_method!(id)

    with {:ok, %ShopShippingMethod{} = shop_shipping_method} <-
           Shipments.update_shop_shipping_method(
             shop_shipping_method,
             shop_shipping_method_params
           ) do
      render(conn, "show.json", shop_shipping_method: shop_shipping_method)
    end
  end

  def delete(conn, %{"id" => id}) do
    shop_shipping_method = Shipments.get_shop_shipping_method!(id)

    with {:ok, %ShopShippingMethod{}} <-
           Shipments.delete_shop_shipping_method(shop_shipping_method) do
      send_resp(conn, :no_content, "")
    end
  end
end
