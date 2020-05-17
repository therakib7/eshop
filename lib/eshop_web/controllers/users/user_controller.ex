defmodule EshopWeb.UserController do
  use EshopWeb, :controller

  alias Eshop.Users
  alias Eshop.Users.User

  action_fallback EshopWeb.FallbackController

  import Ecto.Query, only: [from: 2]

  def index(conn, _params) do
    # users = Users.list_users()
    # render(conn, "index.json", users: users)
    users = from(m in Eshop.Users.UserRole, where: m.user_id == 1, select: %{role_id: m.role_id, id: m.id}, join: p in Eshop.Users.RolePermission, on: m.role_id == p.role_id, )       
    hhh = Eshop.Repo.all(users) 
    render(conn, "index.json", users: hhh)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Users.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Users.get_user!(id)

    with {:ok, %User{} = user} <- Users.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Users.get_user!(id)

    with {:ok, %User{}} <- Users.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
