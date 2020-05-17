defmodule EshopWeb.LoginDetailController do
  use EshopWeb, :controller

  alias Eshop.Users
  alias Eshop.Users.LoginDetail

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    login_details = Users.list_login_details()
    render(conn, "index.json", login_details: login_details)
  end

  def create(conn, %{"login_detail" => login_detail_params}) do
    with {:ok, %LoginDetail{} = login_detail} <- Users.create_login_detail(login_detail_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.login_detail_path(conn, :show, login_detail))
      |> render("show.json", login_detail: login_detail)
    end
  end

  def show(conn, %{"id" => id}) do
    login_detail = Users.get_login_detail!(id)
    render(conn, "show.json", login_detail: login_detail)
  end

  def update(conn, %{"id" => id, "login_detail" => login_detail_params}) do
    login_detail = Users.get_login_detail!(id)

    with {:ok, %LoginDetail{} = login_detail} <-
           Users.update_login_detail(login_detail, login_detail_params) do
      render(conn, "show.json", login_detail: login_detail)
    end
  end

  def delete(conn, %{"id" => id}) do
    login_detail = Users.get_login_detail!(id)

    with {:ok, %LoginDetail{}} <- Users.delete_login_detail(login_detail) do
      send_resp(conn, :no_content, "")
    end
  end
end
