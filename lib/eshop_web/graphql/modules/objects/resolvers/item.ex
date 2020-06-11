# defmodule EshopWeb.Schema.Resolvers.Item do
#   def list_items(_parent, _args, _resolution) do
#     {:ok, Eshop.Objects.list_items()}
#   end

#   def get_item(_, %{id: id}, _) do
#     {:ok, Eshop.Objects.get_item!(id)}
#   end

#   def create_item(_parent, args, %{context: %{current_user: current_user}}) do
#     args = Map.put(args, :user_id, current_user["sub"])
#     Eshop.Objects.create_item(args)
#   end

#   def update_item(%{id: id, item_params: item_params}, _info) do
#     case {:ok, Eshop.Objects.get_item!(id)} do
#       {:ok, item} -> item |> Eshop.Objects.update_item(item_params)
#     end
#   end

#   def delete_item(%{id: id}, _info) do
#     case {:ok, Eshop.Objects.get_item!(id)} do
#       {:ok, item} -> item |> Eshop.Objects.delete_item()
#     end
#   end
# end
