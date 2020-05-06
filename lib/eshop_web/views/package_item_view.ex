defmodule EshopWeb.PackageItemView do
  use EshopWeb, :view
  alias EshopWeb.PackageItemView

  def render("index.json", %{package_items: package_items}) do
    %{data: render_many(package_items, PackageItemView, "package_item.json")}
  end

  def render("show.json", %{package_item: package_item}) do
    %{data: render_one(package_item, PackageItemView, "package_item.json")}
  end

  def render("package_item.json", %{package_item: package_item}) do
    %{id: package_item.id,
      name: package_item.name,
      native_name: package_item.native_name}
  end
end
