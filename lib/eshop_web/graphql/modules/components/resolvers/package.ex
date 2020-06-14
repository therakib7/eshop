defmodule EshopWeb.Schema.Resolvers.Package do
  def list_packages(_parent, _args, _resolution) do
    {:ok, Eshop.Components.list_packages()}
  end

  def get_package(_, %{id: id}, _) do
    {:ok, Eshop.Components.get_package!(id)}
  end

  def create_package(_parent, args, %{context: %{current_user: current_user}}) do
    args = Map.put(args, :user_id, current_user["sub"])
    Eshop.Components.create_package(args)
  end

  def update_package(%{id: id, package_params: package_params}, _info) do
    case {:ok, Eshop.Components.get_package!(id)} do
      {:ok, package} -> package |> Eshop.Components.update_package(package_params)
    end
  end

  def delete_package(%{id: id}, _info) do
    case {:ok, Eshop.Components.get_package!(id)} do
      {:ok, package} -> package |> Eshop.Components.delete_package()
    end
  end
end
