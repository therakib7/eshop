defmodule EshopWeb.Schema.Resolvers.TypeStatus do
  def list_type_statuses(_parent, _args, _resolution) do
    {:ok, Eshop.Components.list_type_statuses()}
  end

  def get_type_status(_, %{id: id}, _) do
    {:ok, Eshop.Components.get_type_status!(id)}
  end

  def create_type_status(_parent, args, _resolution) do
    Eshop.Components.create_type_status(args)
  end

  def update_type_status(%{id: id, type_status_params: type_status_params}, _info) do
    case {:ok, Eshop.Components.get_type_status!(id)} do
      {:ok, type_status} -> type_status |> Eshop.Components.update_type_status(type_status_params)
    end
  end

  def delete_type_status(%{id: id}, _info) do
    case {:ok, Eshop.Components.get_type_status!(id)} do
      {:ok, type_status} -> type_status |> Eshop.Components.delete_type_status()
    end
  end
end
