defmodule EshopWeb.Schema.Resolvers.PasswordReset do
  def list_password_resets(_parent, _args, _resolution) do
    {:ok, Eshop.Users.list_password_resets()}
  end

  def get_password_reset(_, %{id: id}, _) do
    {:ok, Eshop.Users.get_password_reset!(id)}
  end

  def create_password_reset(_parent, args, _resolution) do
    Eshop.Users.create_password_reset(args)
  end

  def update_password_reset(%{id: id, password_reset_params: password_reset_params}, _info) do
    case {:ok, Eshop.Users.get_password_reset!(id)} do
      {:ok, password_reset} ->
        password_reset |> Eshop.Users.update_password_reset(password_reset_params)
    end
  end

  def delete_password_reset(%{id: id}, _info) do
    case {:ok, Eshop.Users.get_password_reset!(id)} do
      {:ok, password_reset} -> password_reset |> Eshop.Users.delete_password_reset()
    end
  end
end
