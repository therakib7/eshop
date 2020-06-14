defmodule EshopWeb.Schema.Resolvers.Brand do
  def list_brands(_parent, _args, _resolution) do
    {:ok, Eshop.Components.list_brands()}
  end

  def get_brand(_, %{id: id}, _) do
    {:ok, Eshop.Components.get_brand!(id)}
  end

  def create_brand(_parent, args, %{context: %{current_user: current_user}}) do
    args = Map.put(args, :user_id, current_user["sub"])
    Eshop.Components.create_brand(args)
  end

  def update_brand(%{id: id, brand_params: brand_params}, _info) do
    case {:ok, Eshop.Components.get_brand!(id)} do
      {:ok, brand} -> brand |> Eshop.Components.update_brand(brand_params)
    end
  end

  def delete_brand(%{id: id}, _info) do
    case {:ok, Eshop.Components.get_brand!(id)} do
      {:ok, brand} -> brand |> Eshop.Components.delete_brand()
    end
  end
end
