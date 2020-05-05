defmodule EshopWeb.UserPermissionView do
  use EshopWeb, :view
  alias EshopWeb.UserPermissionView

  def render("index.json", %{user_permissions: user_permissions}) do
    %{data: render_many(user_permissions, UserPermissionView, "user_permission.json")}
  end

  def render("show.json", %{user_permission: user_permission}) do
    %{data: render_one(user_permission, UserPermissionView, "user_permission.json")}
  end

  def render("user_permission.json", %{user_permission: user_permission}) do
    %{id: user_permission.id}
  end
end
