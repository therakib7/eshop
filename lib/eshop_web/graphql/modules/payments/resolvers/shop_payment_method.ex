defmodule EshopWeb.Schema.Resolvers.ShopPaymentMethod do
  def list_shop_payment_methods(_parent, _args, _resolution) do
    {:ok, Eshop.Payments.list_shop_payment_methods()}
  end

  def get_shop_payment_method(_, %{id: id}, _) do
    {:ok, Eshop.Payments.get_shop_payment_method!(id)}
  end

  def create_shop_payment_method(_parent, args, _resolution) do
    Eshop.Payments.create_shop_payment_method(args)
  end

  def update_shop_payment_method(
        %{id: id, shop_payment_method_params: shop_payment_method_params},
        _info
      ) do
    case {:ok, Eshop.Payments.get_shop_payment_method!(id)} do
      {:ok, shop_payment_method} ->
        shop_payment_method
        |> Eshop.Payments.update_shop_payment_method(shop_payment_method_params)
    end
  end

  def delete_shop_payment_method(%{id: id}, _info) do
    case {:ok, Eshop.Payments.get_shop_payment_method!(id)} do
      {:ok, shop_payment_method} ->
        shop_payment_method |> Eshop.Payments.delete_shop_payment_method()
    end
  end
end
