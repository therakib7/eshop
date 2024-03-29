defmodule EshopWeb.Schema.Resolvers.User do
  def relay_list_users(_, args, _) do
    # args = Map.put(args, :order_by, %{sort_order: :desc}) 
    Absinthe.Relay.Connection.from_query(
      Eshop.Users.relay_list_users(args),
      &Eshop.Repo.all/1,
      args
    )
  end

  def list_users(_parent, args, _resolution) do
    {:ok, Eshop.Users.list_users(args)}
  end

  def get_user(_, %{id: id}, _resolution) do
    {:ok, Eshop.Users.get_user!(id)}
  end

  def create_user(_parent, args, _resolution) do
    Eshop.Users.create_user(args)
  end

  def update_user(%{id: id, user_params: user_params}, __resolution) do
    case {:ok, Eshop.Users.get_user!(id)} do
      {:ok, user} -> user |> Eshop.Users.update_user(user_params)
    end

    # {:error, message: "Unknown dd user", code: 21}
  end

  def delete_user(%{id: id}, _info) do
    case {:ok, Eshop.Users.get_user!(id)} do
      {:ok, user} -> user |> Eshop.Users.delete_user()
    end
  end
end
