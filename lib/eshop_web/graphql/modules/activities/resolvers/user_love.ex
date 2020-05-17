defmodule EshopWeb.Schema.Resolvers.UserLove do
  def list_user_loves(_parent, _args, _resolution) do
    {:ok, Eshop.Activities.list_user_loves()}
  end

  def get_user_love(_, %{id: id}, _) do
    {:ok, Eshop.Activities.get_user_love!(id)}
  end

  def create_user_love(_parent, args, _resolution) do
    Eshop.Activities.create_user_love(args)
  end

  def update_user_love(%{id: id, user_love_params: user_love_params}, _info) do
    case {:ok, Eshop.Activities.get_user_love!(id)} do
      {:ok, user_love} -> user_love |> Eshop.Activities.update_user_love(user_love_params)
    end
  end

  def delete_user_love(%{id: id}, _info) do
    case {:ok, Eshop.Activities.get_user_love!(id)} do
      {:ok, user_love} -> user_love |> Eshop.Activities.delete_user_love()
    end
  end
end
