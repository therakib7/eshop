defmodule EshopWeb.UserSettingView do
  use EshopWeb, :view
  alias EshopWeb.UserSettingView

  def render("index.json", %{user_settings: user_settings}) do
    %{data: render_many(user_settings, UserSettingView, "user_setting.json")}
  end

  def render("show.json", %{user_setting: user_setting}) do
    %{data: render_one(user_setting, UserSettingView, "user_setting.json")}
  end

  def render("user_setting.json", %{user_setting: user_setting}) do
    %{id: user_setting.id, key: user_setting.key, value: user_setting.value}
  end
end
