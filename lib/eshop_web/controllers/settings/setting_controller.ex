defmodule EshopWeb.SettingController do
  use EshopWeb, :controller

  alias Eshop.Settings
  alias Eshop.Settings.Setting

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    settings = Settings.list_settings()
    render(conn, "index.json", settings: settings)
  end

  def create(conn, %{"setting" => setting_params}) do
    with {:ok, %Setting{} = setting} <- Settings.create_setting(setting_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.setting_path(conn, :show, setting))
      |> render("show.json", setting: setting)
    end
  end

  def show(conn, %{"id" => id}) do
    setting = Settings.get_setting!(id)
    render(conn, "show.json", setting: setting)
  end

  def update(conn, %{"id" => id, "setting" => setting_params}) do
    setting = Settings.get_setting!(id)

    with {:ok, %Setting{} = setting} <- Settings.update_setting(setting, setting_params) do
      render(conn, "show.json", setting: setting)
    end
  end

  def delete(conn, %{"id" => id}) do
    setting = Settings.get_setting!(id)

    with {:ok, %Setting{}} <- Settings.delete_setting(setting) do
      send_resp(conn, :no_content, "")
    end
  end
end
