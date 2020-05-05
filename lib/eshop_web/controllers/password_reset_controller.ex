defmodule EshopWeb.PasswordResetController do
  use EshopWeb, :controller

  alias Eshop.Accounts
  alias Eshop.Accounts.PasswordReset

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    password_resets = Accounts.list_password_resets()
    render(conn, "index.json", password_resets: password_resets)
  end

  def create(conn, %{"password_reset" => password_reset_params}) do
    with {:ok, %PasswordReset{} = password_reset} <- Accounts.create_password_reset(password_reset_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.password_reset_path(conn, :show, password_reset))
      |> render("show.json", password_reset: password_reset)
    end
  end

  def show(conn, %{"id" => id}) do
    password_reset = Accounts.get_password_reset!(id)
    render(conn, "show.json", password_reset: password_reset)
  end

  def update(conn, %{"id" => id, "password_reset" => password_reset_params}) do
    password_reset = Accounts.get_password_reset!(id)

    with {:ok, %PasswordReset{} = password_reset} <- Accounts.update_password_reset(password_reset, password_reset_params) do
      render(conn, "show.json", password_reset: password_reset)
    end
  end

  def delete(conn, %{"id" => id}) do
    password_reset = Accounts.get_password_reset!(id)

    with {:ok, %PasswordReset{}} <- Accounts.delete_password_reset(password_reset) do
      send_resp(conn, :no_content, "")
    end
  end
end
