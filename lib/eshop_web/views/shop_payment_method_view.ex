defmodule EshopWeb.ShopPaymentMethodView do
  use EshopWeb, :view
  alias EshopWeb.ShopPaymentMethodView

  def render("index.json", %{shop_payment_methods: shop_payment_methods}) do
    %{data: render_many(shop_payment_methods, ShopPaymentMethodView, "shop_payment_method.json")}
  end

  def render("show.json", %{shop_payment_method: shop_payment_method}) do
    %{data: render_one(shop_payment_method, ShopPaymentMethodView, "shop_payment_method.json")}
  end

  def render("shop_payment_method.json", %{shop_payment_method: shop_payment_method}) do
    %{id: shop_payment_method.id,
      is_active: shop_payment_method.is_active,
      ac_holder_name: shop_payment_method.ac_holder_name,
      ac_no: shop_payment_method.ac_no,
      account_type: shop_payment_method.account_type}
  end
end
