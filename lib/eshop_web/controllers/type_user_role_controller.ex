defmodule EshopWeb.TypeUserRoleController do
  use EshopWeb, :controller

  alias Eshop.Companies
  alias Eshop.Companies.TypeUserRole

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    type_user_roles = Companies.list_type_user_roles()
    render(conn, "index.json", type_user_roles: type_user_roles)
  end

  def create(conn, %{"type_user_role" => type_user_role_params}) do
    with {:ok, %TypeUserRole{} = type_user_role} <- Companies.create_type_user_role(type_user_role_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.type_user_role_path(conn, :show, type_user_role))
      |> render("show.json", type_user_role: type_user_role)
    end
  end

  def show(conn, %{"id" => id}) do
    type_user_role = Companies.get_type_user_role!(id)
    render(conn, "show.json", type_user_role: type_user_role)
  end

  def update(conn, %{"id" => id, "type_user_role" => type_user_role_params}) do
    type_user_role = Companies.get_type_user_role!(id)

    with {:ok, %TypeUserRole{} = type_user_role} <- Companies.update_type_user_role(type_user_role, type_user_role_params) do
      render(conn, "show.json", type_user_role: type_user_role)
    end
  end

  def delete(conn, %{"id" => id}) do
    type_user_role = Companies.get_type_user_role!(id)

    with {:ok, %TypeUserRole{}} <- Companies.delete_type_user_role(type_user_role) do
      send_resp(conn, :no_content, "")
    end
  end
end
