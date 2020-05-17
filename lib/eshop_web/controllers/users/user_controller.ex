defmodule EshopWeb.UserController do
  use EshopWeb, :controller

  alias Eshop.Users
  alias Eshop.Users.User

  action_fallback EshopWeb.FallbackController

  import Ecto.Query, only: [from: 2]

  def index(conn, _params) do
    # users = Users.list_users()
    # render(conn, "index.json", users: users)
    role_ids = from(m in Eshop.Users.UserRole, where: m.user_id == 1, select: %{role_id: m.role_id, id: m.id} )       
    |> Eshop.Repo.all() 
    |> Enum.map( fn (x) -> x.role_id end)

    per_ids = from(m in Eshop.Users.RolePermission, where: m.role_id in ^role_ids, select: %{permission_id: m.permission_id})       
    |> Eshop.Repo.all() 
    |> Enum.map( fn (x) -> x.permission_id end) 
    #|> Enum.uniq()

    has_per = Enum.member?(per_ids, 1) 

    render(conn, "index.json", users: has_per)
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
