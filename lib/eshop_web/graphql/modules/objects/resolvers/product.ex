defmodule EshopWeb.Schema.Resolvers.Product do
  def list_products(_parent, _args, _resolution) do
    {:ok, Eshop.Objects.list_products()}
  end

  def get_product(_, %{id: id}, _) do
    {:ok, Eshop.Objects.get_product!(id)}
  end

  def create_product(_parent, args, _resolution) do
    Eshop.Objects.create_product(args)
  end

  def update_product(%{id: id, product_params: product_params}, _info) do
    case {:ok, Eshop.Objects.get_product!(id)} do
      {:ok, product} -> product |> Eshop.Objects.update_product(product_params)
    end
  end

  def delete_product(%{id: id}, _info) do
    case {:ok, Eshop.Objects.get_product!(id)} do
      {:ok, product} -> product |> Eshop.Objects.delete_product()
    end
  end
end
