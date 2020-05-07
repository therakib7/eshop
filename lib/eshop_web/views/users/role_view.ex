defmodule EshopWeb.RoleView do
  use EshopWeb, :view
  alias EshopWeb.RoleView

  def render("index.json", %{roles: roles}) do
    %{data: render_many(roles, RoleView, "role.json")}
  end

  def render("show.json", %{role: role}) do
    %{data: render_one(role, RoleView, "role.json")}
  end

  def render("role.json", %{role: role}) do
    %{id: role.id,
      name: role.name,
      native_name: role.native_name,
      desc: role.desc,
      is_company: role.is_company}
  end
end
