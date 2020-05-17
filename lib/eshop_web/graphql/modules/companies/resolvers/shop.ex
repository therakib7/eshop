defmodule EshopWeb.Schema.Resolvers.Shop do
  def list_shops(_parent, _args, _resolution) do
    {:ok, Eshop.Companies.list_shops()}
  end

  def get_shop(_, %{id: id}, _) do
    {:ok, Eshop.Companies.get_shop!(id)}
  end

  def create_shop(_parent, args, _resolution) do
    Eshop.Companies.create_shop(args)
  end

  def update_shop(%{id: id, shop_params: shop_params}, _info) do
    case {:ok, Eshop.Companies.get_shop!(id)} do
      {:ok, shop} -> shop |> Eshop.Companies.update_shop(shop_params)
    end
  end

  def delete_shop(%{id: id}, _info) do
    case {:ok, Eshop.Companies.get_shop!(id)} do
      {:ok, shop} -> shop |> Eshop.Companies.delete_shop()
    end
  end
end
