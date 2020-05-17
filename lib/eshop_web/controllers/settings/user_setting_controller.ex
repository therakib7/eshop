defmodule EshopWeb.UserSettingController do
  use EshopWeb, :controller

  alias Eshop.Settings
  alias Eshop.Settings.UserSetting

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    user_settings = Settings.list_user_settings()
    render(conn, "index.json", user_settings: user_settings)
  end

  def create(conn, %{"user_setting" => user_setting_params}) do
    with {:ok, %UserSetting{} = user_setting} <- Settings.create_user_setting(user_setting_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_setting_path(conn, :show, user_setting))
      |> render("show.json", user_setting: user_setting)
    end
  end

  def show(conn, %{"id" => id}) do
    user_setting = Settings.get_user_setting!(id)
    render(conn, "show.json", user_setting: user_setting)
  end

  def update(conn, %{"id" => id, "user_setting" => user_setting_params}) do
    user_setting = Settings.get_user_setting!(id)

    with {:ok, %UserSetting{} = user_setting} <-
           Settings.update_user_setting(user_setting, user_setting_params) do
      render(conn, "show.json", user_setting: user_setting)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_setting = Settings.get_user_setting!(id)

    with {:ok, %UserSetting{}} <- Settings.delete_user_setting(user_setting) do
      send_resp(conn, :no_content, "")
    end
  end
end
