defmodule EshopWeb.Schema.Resolvers.TypeCategory do
  def list_type_categories(_parent, _args, _resolution) do
    {:ok, Eshop.Components.list_type_categories()}
  end

  def get_type_category(_, %{id: id}, _) do
    {:ok, Eshop.Components.get_type_category!(id)}
  end

  def create_type_category(_parent, args, _resolution) do
    Eshop.Components.create_type_category(args)
  end

  def update_type_category(%{id: id, type_category_params: type_category_params}, _info) do
    case {:ok, Eshop.Components.get_type_category!(id)} do
      {:ok, type_category} ->
        type_category |> Eshop.Components.update_type_category(type_category_params)
    end
  end

  def delete_type_category(%{id: id}, _info) do
    case {:ok, Eshop.Components.get_type_category!(id)} do
      {:ok, type_category} -> type_category |> Eshop.Components.delete_type_category()
    end
  end
end
