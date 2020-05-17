defmodule EshopWeb.Schema.Resolvers.Variant do
  def list_variants(_parent, _args, _resolution) do
    {:ok, Eshop.Components.list_variants()}
  end

  def get_variant(_, %{id: id}, _) do
    {:ok, Eshop.Components.get_variant!(id)}
  end

  def create_variant(_parent, args, _resolution) do
    Eshop.Components.create_variant(args)
  end

  def update_variant(%{id: id, variant_params: variant_params}, _info) do
    case {:ok, Eshop.Components.get_variant!(id)} do
      {:ok, variant} -> variant |> Eshop.Components.update_variant(variant_params)
    end
  end

  def delete_variant(%{id: id}, _info) do
    case {:ok, Eshop.Components.get_variant!(id)} do
      {:ok, variant} -> variant |> Eshop.Components.delete_variant()
    end
  end
end
