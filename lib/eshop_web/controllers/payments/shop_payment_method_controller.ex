defmodule EshopWeb.ShopPaymentMethodController do
  use EshopWeb, :controller

  alias Eshop.Payments
  alias Eshop.Payments.ShopPaymentMethod

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    shop_payment_methods = Payments.list_shop_payment_methods()
    render(conn, "index.json", shop_payment_methods: shop_payment_methods)
  end

  def create(conn, %{"shop_payment_method" => shop_payment_method_params}) do
    with {:ok, %ShopPaymentMethod{} = shop_payment_method} <-
           Payments.create_shop_payment_method(shop_payment_method_params) do
      conn
      |> put_status(:created)
      |> put_resp_header(
        "location",
        Routes.shop_payment_method_path(conn, :show, shop_payment_method)
      )
      |> render("show.json", shop_payment_method: shop_payment_method)
    end
  end

  def show(conn, %{"id" => id}) do
    shop_payment_method = Payments.get_shop_payment_method!(id)
    render(conn, "show.json", shop_payment_method: shop_payment_method)
  end

  def update(conn, %{"id" => id, "shop_payment_method" => shop_payment_method_params}) do
    shop_payment_method = Payments.get_shop_payment_method!(id)

    with {:ok, %ShopPaymentMethod{} = shop_payment_method} <-
           Payments.update_shop_payment_method(shop_payment_method, shop_payment_method_params) do
      render(conn, "show.json", shop_payment_method: shop_payment_method)
    end
  end

  def delete(conn, %{"id" => id}) do
    shop_payment_method = Payments.get_shop_payment_method!(id)

    with {:ok, %ShopPaymentMethod{}} <- Payments.delete_shop_payment_method(shop_payment_method) do
      send_resp(conn, :no_content, "")
    end
  end
end
