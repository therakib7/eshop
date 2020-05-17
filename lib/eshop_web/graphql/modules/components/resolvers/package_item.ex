defmodule EshopWeb.Schema.Resolvers.PackageItem do
  def list_package_items(_parent, _args, _resolution) do
    {:ok, Eshop.Components.list_package_items()}
  end

  def get_package_item(_, %{id: id}, _) do
    {:ok, Eshop.Components.get_package_item!(id)}
  end

  def create_package_item(_parent, args, _resolution) do
    Eshop.Components.create_package_item(args)
  end

  def update_package_item(%{id: id, package_item_params: package_item_params}, _info) do
    case {:ok, Eshop.Components.get_package_item!(id)} do
      {:ok, package_item} ->
        package_item |> Eshop.Components.update_package_item(package_item_params)
    end
  end

  def delete_package_item(%{id: id}, _info) do
    case {:ok, Eshop.Components.get_package_item!(id)} do
      {:ok, package_item} -> package_item |> Eshop.Components.delete_package_item()
    end
  end
end
