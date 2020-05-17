defmodule EshopWeb.UserPermissionController do
  use EshopWeb, :controller

  alias Eshop.Users
  alias Eshop.Users.UserPermission

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    user_permissions = Users.list_user_permissions()
    render(conn, "index.json", user_permissions: user_permissions)
  end

  def create(conn, %{"user_permission" => user_permission_params}) do
    with {:ok, %UserPermission{} = user_permission} <-
           Users.create_user_permission(user_permission_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_permission_path(conn, :show, user_permission))
      |> render("show.json", user_permission: user_permission)
    end
  end

  def show(conn, %{"id" => id}) do
    user_permission = Users.get_user_permission!(id)
    render(conn, "show.json", user_permission: user_permission)
  end

  def update(conn, %{"id" => id, "user_permission" => user_permission_params}) do
    user_permission = Users.get_user_permission!(id)

    with {:ok, %UserPermission{} = user_permission} <-
           Users.update_user_permission(user_permission, user_permission_params) do
      render(conn, "show.json", user_permission: user_permission)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_permission = Users.get_user_permission!(id)

    with {:ok, %UserPermission{}} <- Users.delete_user_permission(user_permission) do
      send_resp(conn, :no_content, "")
    end
  end
end
