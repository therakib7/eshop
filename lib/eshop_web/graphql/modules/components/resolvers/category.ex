defmodule EshopWeb.Schema.Resolvers.Category do
  def list_categories(_parent, _args, _resolution) do
    {:ok, Eshop.Components.list_categories()}
  end

  def get_category(_, %{id: id}, _) do
    {:ok, Eshop.Components.get_category!(id)}
  end

  def create_category(_parent, args, %{context: %{current_user: current_user}}) do
    args = Map.put(args, :user_id, current_user["sub"])
    Eshop.Components.create_category(args)
  end

  def update_category(%{id: id, category_params: category_params}, _info) do
    case {:ok, Eshop.Components.get_category!(id)} do
      {:ok, category} -> category |> Eshop.Components.update_category(category_params)
    end 
  end

  def delete_category(%{id: id}, _info) do
    case {:ok, Eshop.Components.get_category!(id)} do
      {:ok, category} -> category |> Eshop.Components.delete_category()
    end
  end
end
