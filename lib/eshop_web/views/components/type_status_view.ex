defmodule EshopWeb.TypeStatusView do
  use EshopWeb, :view
  alias EshopWeb.TypeStatusView

  def render("index.json", %{type_statuses: type_statuses}) do
    %{data: render_many(type_statuses, TypeStatusView, "type_status.json")}
  end

  def render("show.json", %{type_status: type_status}) do
    %{data: render_one(type_status, TypeStatusView, "type_status.json")}
  end

  def render("type_status.json", %{type_status: type_status}) do
    %{id: type_status.id,
      is_active: type_status.is_active,
      order: type_status.order,
      type: type_status.type,
      name: type_status.name,
      native_name: type_status.native_name}
  end
end
