defmodule EshopWeb.CategoryView do
  use EshopWeb, :view
  alias EshopWeb.CategoryView

  def render("index.json", %{categories: categories}) do
    %{data: render_many(categories, CategoryView, "category.json")}
  end

  def render("show.json", %{category: category}) do
    %{data: render_one(category, CategoryView, "category.json")}
  end

  def render("category.json", %{category: category}) do
    %{
      id: category.id,
      is_active: category.is_active,
      name: category.name,
      native_name: category.native_name,
      slug: category.slug
    }
  end
end
