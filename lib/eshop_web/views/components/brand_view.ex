defmodule EshopWeb.BrandView do
  use EshopWeb, :view
  alias EshopWeb.BrandView

  def render("index.json", %{brands: brands}) do
    %{data: render_many(brands, BrandView, "brand.json")}
  end

  def render("show.json", %{brand: brand}) do
    %{data: render_one(brand, BrandView, "brand.json")}
  end

  def render("brand.json", %{brand: brand}) do
    %{
      id: brand.id,
      is_active: brand.is_active,
      name: brand.name,
      native_name: brand.native_name,
      slug: brand.slug,
      loves: brand.loves
    }
  end
end
