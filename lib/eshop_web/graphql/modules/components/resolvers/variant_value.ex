defmodule EshopWeb.Schema.Resolvers.VariantValue do
  def list_variant_values(_parent, _args, _resolution) do
    {:ok, Eshop.Components.list_variant_values()}
  end

  def get_variant_value(_, %{id: id}, _) do
    {:ok, Eshop.Components.get_variant_value!(id)}
  end

  def create_variant_value(_parent, args, _resolution) do
    Eshop.Components.create_variant_value(args)
  end

  def update_variant_value(%{id: id, variant_value_params: variant_value_params}, _info) do
    case {:ok, Eshop.Components.get_variant_value!(id)} do
      {:ok, variant_value} ->
        variant_value |> Eshop.Components.update_variant_value(variant_value_params)
    end
  end

  def delete_variant_value(%{id: id}, _info) do
    case {:ok, Eshop.Components.get_variant_value!(id)} do
      {:ok, variant_value} -> variant_value |> Eshop.Components.delete_variant_value()
    end
  end
end
