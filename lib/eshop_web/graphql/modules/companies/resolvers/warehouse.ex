defmodule EshopWeb.Schema.Resolvers.Warehouse do
  def list_warehouses(_parent, _args, _resolution) do
    {:ok, Eshop.Companies.list_warehouses()}
  end

  def get_warehouse(_, %{id: id}, _) do
    {:ok, Eshop.Companies.get_warehouse!(id)}
  end

  def create_warehouse(_parent, args, _resolution) do
    Eshop.Companies.create_warehouse(args)
  end

  def update_warehouse(%{id: id, warehouse_params: warehouse_params}, _info) do
    case {:ok, Eshop.Companies.get_warehouse!(id)} do
      {:ok, warehouse} -> warehouse |> Eshop.Companies.update_warehouse(warehouse_params)
    end
  end

  def delete_warehouse(%{id: id}, _info) do
    case {:ok, Eshop.Companies.get_warehouse!(id)} do
      {:ok, warehouse} -> warehouse |> Eshop.Companies.delete_warehouse()
    end
  end
end
