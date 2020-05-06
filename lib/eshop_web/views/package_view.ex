defmodule EshopWeb.PackageView do
  use EshopWeb, :view
  alias EshopWeb.PackageView

  def render("index.json", %{packages: packages}) do
    %{data: render_many(packages, PackageView, "package.json")}
  end

  def render("show.json", %{package: package}) do
    %{data: render_one(package, PackageView, "package.json")}
  end

  def render("package.json", %{package: package}) do
    %{id: package.id,
      cost_price: package.cost_price,
      unit_price: package.unit_price,
      sale_price: package.sale_price}
  end
end
