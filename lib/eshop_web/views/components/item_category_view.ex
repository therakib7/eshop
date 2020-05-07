defmodule EshopWeb.ItemCategoryView do
  use EshopWeb, :view
  alias EshopWeb.ItemCategoryView

  def render("index.json", %{item_categories: item_categories}) do
    %{data: render_many(item_categories, ItemCategoryView, "item_category.json")}
  end

  def render("show.json", %{item_category: item_category}) do
    %{data: render_one(item_category, ItemCategoryView, "item_category.json")}
  end

  def render("item_category.json", %{item_category: item_category}) do
    %{id: item_category.id}
  end
end
