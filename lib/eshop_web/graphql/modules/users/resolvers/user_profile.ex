defmodule EshopWeb.Schema.Resolvers.UserProfile do
  def list_user_profiles(_parent, _args, _resolution) do
    {:ok, Eshop.Users.list_user_profiles()}
  end

  def get_user_profile(_, %{id: id}, _) do
    {:ok, Eshop.Users.get_user_profile!(id)}
  end

  def create_user_profile(_parent, args, _resolution) do
    Eshop.Users.create_user_profile(args)
  end

  def update_user_profile(%{id: id, user_profile_params: user_profile_params}, _info) do
    case {:ok, Eshop.Users.get_user_profile!(id)} do
      {:ok, user_profile} -> user_profile |> Eshop.Users.update_user_profile(user_profile_params)
    end
  end

  def delete_user_profile(%{id: id}, _info) do
    case {:ok, Eshop.Users.get_user_profile!(id)} do
      {:ok, user_profile} -> user_profile |> Eshop.Users.delete_user_profile()
    end
  end
end
