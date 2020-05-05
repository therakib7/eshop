defmodule EshopWeb.PasswordResetView do
  use EshopWeb, :view
  alias EshopWeb.PasswordResetView

  def render("index.json", %{password_resets: password_resets}) do
    %{data: render_many(password_resets, PasswordResetView, "password_reset.json")}
  end

  def render("show.json", %{password_reset: password_reset}) do
    %{data: render_one(password_reset, PasswordResetView, "password_reset.json")}
  end

  def render("password_reset.json", %{password_reset: password_reset}) do
    %{id: password_reset.id,
      token: password_reset.token,
      created_at: password_reset.created_at}
  end
end
