defmodule EshopWeb.Schema.Resolvers.LoginDetail do
  def list_login_details(_parent, _args, _resolution) do
    {:ok, Eshop.Users.list_login_details()}
  end

  def get_login_detail(_, %{id: id}, _) do
    {:ok, Eshop.Users.get_login_detail!(id)}
  end

  def create_login_detail(_parent, args, _resolution) do
    Eshop.Users.create_login_detail(args)
  end

  def update_login_detail(%{id: id, login_detail_params: login_detail_params}, _info) do
    case {:ok, Eshop.Users.get_login_detail!(id)} do
      {:ok, login_detail} -> login_detail |> Eshop.Users.update_login_detail(login_detail_params)
    end
  end

  def delete_login_detail(%{id: id}, _info) do
    case {:ok, Eshop.Users.get_login_detail!(id)} do
      {:ok, login_detail} -> login_detail |> Eshop.Users.delete_login_detail()
    end
  end
end
