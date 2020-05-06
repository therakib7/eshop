defmodule EshopWeb.CompanySettingView do
  use EshopWeb, :view
  alias EshopWeb.CompanySettingView

  def render("index.json", %{company_settings: company_settings}) do
    %{data: render_many(company_settings, CompanySettingView, "company_setting.json")}
  end

  def render("show.json", %{company_setting: company_setting}) do
    %{data: render_one(company_setting, CompanySettingView, "company_setting.json")}
  end

  def render("company_setting.json", %{company_setting: company_setting}) do
    %{id: company_setting.id,
      type: company_setting.type,
      type_id: company_setting.type_id,
      key: company_setting.key,
      value: company_setting.value}
  end
end
