defmodule EshopWeb.Schema.Resolvers.ItemCategory do
  def list_item_categories(_parent, _args, _resolution) do
    {:ok, Eshop.Components.list_item_categories()}
  end

  def get_item_category(_, %{id: id}, _) do
    {:ok, Eshop.Components.get_item_category!(id)}
  end

  def create_item_category(_parent, args, _resolution) do
    Eshop.Components.create_item_category(args)
  end

  def update_item_category(%{id: id, item_category_params: item_category_params}, _info) do
    case {:ok, Eshop.Components.get_item_category!(id)} do
      {:ok, item_category} ->
        item_category |> Eshop.Components.update_item_category(item_category_params)
    end
  end

  def delete_item_category(%{id: id}, _info) do
    case {:ok, Eshop.Components.get_item_category!(id)} do
      {:ok, item_category} -> item_category |> Eshop.Components.delete_item_category()
    end
  end
end
