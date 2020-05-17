defmodule EshopWeb.Schema.Resolvers.UserRole do
  def list_user_roles(_parent, _args, _resolution) do
    {:ok, Eshop.Users.list_user_roles()}
  end

  def get_user_role(_, %{id: id}, _) do
    {:ok, Eshop.Users.get_user_role!(id)}
  end

  def create_user_role(_parent, args, _resolution) do
    Eshop.Users.create_user_role(args)
  end

  def update_user_role(%{id: id, user_role_params: user_role_params}, _info) do
    case {:ok, Eshop.Users.get_user_role!(id)} do
      {:ok, user_role} -> user_role |> Eshop.Users.update_user_role(user_role_params)
    end
  end

  def delete_user_role(%{id: id}, _info) do
    case {:ok, Eshop.Users.get_user_role!(id)} do
      {:ok, user_role} -> user_role |> Eshop.Users.delete_user_role()
    end
  end
end
