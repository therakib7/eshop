defmodule EshopWeb.CompanySettingController do
  use EshopWeb, :controller

  alias Eshop.Settings
  alias Eshop.Settings.CompanySetting

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    company_settings = Settings.list_company_settings()
    render(conn, "index.json", company_settings: company_settings)
  end

  def create(conn, %{"company_setting" => company_setting_params}) do
    with {:ok, %CompanySetting{} = company_setting} <- Settings.create_company_setting(company_setting_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.company_setting_path(conn, :show, company_setting))
      |> render("show.json", company_setting: company_setting)
    end
  end

  def show(conn, %{"id" => id}) do
    company_setting = Settings.get_company_setting!(id)
    render(conn, "show.json", company_setting: company_setting)
  end

  def update(conn, %{"id" => id, "company_setting" => company_setting_params}) do
    company_setting = Settings.get_company_setting!(id)

    with {:ok, %CompanySetting{} = company_setting} <- Settings.update_company_setting(company_setting, company_setting_params) do
      render(conn, "show.json", company_setting: company_setting)
    end
  end

  def delete(conn, %{"id" => id}) do
    company_setting = Settings.get_company_setting!(id)

    with {:ok, %CompanySetting{}} <- Settings.delete_company_setting(company_setting) do
      send_resp(conn, :no_content, "")
    end
  end
end
