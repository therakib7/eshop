defmodule EshopWeb.SettingView do
  use EshopWeb, :view
  alias EshopWeb.SettingView

  def render("index.json", %{settings: settings}) do
    %{data: render_many(settings, SettingView, "setting.json")}
  end

  def render("show.json", %{setting: setting}) do
    %{data: render_one(setting, SettingView, "setting.json")}
  end

  def render("setting.json", %{setting: setting}) do
    %{id: setting.id, key: setting.key, value: setting.value}
  end
end
