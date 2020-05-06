defmodule EshopWeb.UnitTypeView do
  use EshopWeb, :view
  alias EshopWeb.UnitTypeView

  def render("index.json", %{unit_types: unit_types}) do
    %{data: render_many(unit_types, UnitTypeView, "unit_type.json")}
  end

  def render("show.json", %{unit_type: unit_type}) do
    %{data: render_one(unit_type, UnitTypeView, "unit_type.json")}
  end

  def render("unit_type.json", %{unit_type: unit_type}) do
    %{id: unit_type.id,
      name: unit_type.name,
      native_name: unit_type.native_name}
  end
end
