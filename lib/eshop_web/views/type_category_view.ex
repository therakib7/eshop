defmodule EshopWeb.TypeCategoryView do
  use EshopWeb, :view
  alias EshopWeb.TypeCategoryView

  def render("index.json", %{type_categories: type_categories}) do
    %{data: render_many(type_categories, TypeCategoryView, "type_category.json")}
  end

  def render("show.json", %{type_category: type_category}) do
    %{data: render_one(type_category, TypeCategoryView, "type_category.json")}
  end

  def render("type_category.json", %{type_category: type_category}) do
    %{id: type_category.id,
      type: type_category.type,
      type_id: type_category.type_id}
  end
end
