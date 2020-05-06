defmodule EshopWeb.TypeUserRoleView do
  use EshopWeb, :view
  alias EshopWeb.TypeUserRoleView

  def render("index.json", %{type_user_roles: type_user_roles}) do
    %{data: render_many(type_user_roles, TypeUserRoleView, "type_user_role.json")}
  end

  def render("show.json", %{type_user_role: type_user_role}) do
    %{data: render_one(type_user_role, TypeUserRoleView, "type_user_role.json")}
  end

  def render("type_user_role.json", %{type_user_role: type_user_role}) do
    %{id: type_user_role.id,
      type: type_user_role.type,
      type_id: type_user_role.type_id}
  end
end
