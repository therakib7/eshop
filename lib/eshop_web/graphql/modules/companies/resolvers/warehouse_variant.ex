defmodule EshopWeb.Schema.Resolvers.WarehouseVariant do
  def list_warehouse_variants(_parent, _args, _resolution) do
    {:ok, Eshop.Companies.list_warehouse_variants()}
  end

  def get_warehouse_variant(_, %{id: id}, _) do
    {:ok, Eshop.Companies.get_warehouse_variant!(id)}
  end

  def create_warehouse_variant(_parent, args, _resolution) do
    Eshop.Companies.create_warehouse_variant(args)
  end

  def update_warehouse_variant(
        %{id: id, warehouse_variant_params: warehouse_variant_params},
        _info
      ) do
    case {:ok, Eshop.Companies.get_warehouse_variant!(id)} do
      {:ok, warehouse_variant} ->
        warehouse_variant |> Eshop.Companies.update_warehouse_variant(warehouse_variant_params)
    end
  end

  def delete_warehouse_variant(%{id: id}, _info) do
    case {:ok, Eshop.Companies.get_warehouse_variant!(id)} do
      {:ok, warehouse_variant} -> warehouse_variant |> Eshop.Companies.delete_warehouse_variant()
    end
  end
end
