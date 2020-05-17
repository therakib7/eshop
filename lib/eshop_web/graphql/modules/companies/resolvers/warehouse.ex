defmodule EshopWeb.Schema.Resolvers.Warehouse do
  def list_warahouses(_parent, _args, _resolution) do
    {:ok, Eshop.Companies.list_warahouses()}
  end

  def get_warahouse(_, %{id: id}, _) do
    {:ok, Eshop.Companies.get_warahouse!(id)}
  end

  def create_warahouse(_parent, args, _resolution) do
    Eshop.Companies.create_warahouse(args)
  end

  def update_warahouse(%{id: id, warahouse_params: warahouse_params}, _info) do
    case {:ok, Eshop.Companies.get_warahouse!(id)} do
      {:ok, warahouse} -> warahouse |> Eshop.Companies.update_warahouse(warahouse_params)
    end
  end

  def delete_warahouse(%{id: id}, _info) do
    case {:ok, Eshop.Companies.get_warahouse!(id)} do
      {:ok, warahouse} -> warahouse |> Eshop.Companies.delete_warahouse()
    end
  end
end
