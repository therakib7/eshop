defmodule EshopWeb.Schema.Resolvers.DiscountCode do
  def list_discount_codes(_parent, _args, _resolution) do
    {:ok, Eshop.Components.list_discount_codes()}
  end

  def get_discount_code(_, %{id: id}, _) do
    {:ok, Eshop.Components.get_discount_code!(id)}
  end

  def create_discount_code(_parent, args, _resolution) do
    Eshop.Components.create_discount_code(args)
  end

  def update_discount_code(%{id: id, discount_code_params: discount_code_params}, _info) do
    case {:ok, Eshop.Components.get_discount_code!(id)} do
      {:ok, discount_code} ->
        discount_code |> Eshop.Components.update_discount_code(discount_code_params)
    end
  end

  def delete_discount_code(%{id: id}, _info) do
    case {:ok, Eshop.Components.get_discount_code!(id)} do
      {:ok, discount_code} -> discount_code |> Eshop.Components.delete_discount_code()
    end
  end
end
