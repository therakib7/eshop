defmodule EshopWeb.LoginDetailView do
  use EshopWeb, :view
  alias EshopWeb.LoginDetailView

  def render("index.json", %{login_details: login_details}) do
    %{data: render_many(login_details, LoginDetailView, "login_detail.json")}
  end

  def render("show.json", %{login_detail: login_detail}) do
    %{data: render_one(login_detail, LoginDetailView, "login_detail.json")}
  end

  def render("login_detail.json", %{login_detail: login_detail}) do
    %{
      id: login_detail.id,
      is_active: login_detail.is_active,
      user_agent: login_detail.user_agent,
      ip_address: login_detail.ip_address,
      ip_location: login_detail.ip_location,
      login_at: login_detail.login_at,
      last_activity: login_detail.last_activity
    }
  end
end
